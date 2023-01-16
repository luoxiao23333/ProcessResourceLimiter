package task

import (
	"GOProject/resources"
	"bytes"
	"fmt"
	"github.com/containerd/cgroups/v3/cgroup2"
	"log"
	"os"
	"os/exec"
	"strconv"
	"syscall"
	"time"
)

var taskCount uint64 = 0

const cgroupPrefix string = "Task_Runner"
const cgroupPeriod = 100000
const cgroupPostfix string = ".slice" // must existing for valid unit name

type ExitStatus struct {
	Signal os.Signal
	Code   int
}

type Task interface {
	Run(args ...string) (string, ExitStatus, error)
	GetProcessID() int
}

type CMDTask struct {
	command           string
	args              []string
	pid               int
	resourceLimit     resources.Profile
	memoryEventHandle func()
}

func NewCMDTask(command string, resourceLimit resources.Profile,
	memoryEventHandle func(), args ...string) *CMDTask {
	return &CMDTask{
		command:           command,
		args:              args,
		pid:               -1,
		resourceLimit:     resourceLimit,
		memoryEventHandle: memoryEventHandle,
	}
}

func (t *CMDTask) Run(args ...string) (string, ExitStatus, error) {
	cmdOut := bytes.Buffer{}

	cmd := exec.Command(t.command, args...)
	cmd.Stdout = &cmdOut

	// start app
	if err := cmd.Start(); err != nil {
		log.Panic(err)
	}

	t.pid = cmd.Process.Pid
	resourceManager := t.limitResources()

	if err := cmd.Wait(); err != nil {
		log.Println("cmd return with error:", err)
	}

	status := cmd.ProcessState.Sys().(syscall.WaitStatus)

	exitStatus := ExitStatus{
		Code:   status.ExitStatus(),
		Signal: status.Signal(),
	}

	if exitStatus.Signal == syscall.SIGKILL {
		t.handleEvent(resourceManager)
	}

	err := resourceManager.DeleteSystemd()
	if err != nil {
		log.Panic(err)
	}

	return cmdOut.String(), exitStatus, nil

}

func (t *CMDTask) limitResources() *cgroup2.Manager {
	period := uint64(cgroupPeriod)
	var quota = int64(period * t.resourceLimit.CpuCoresPercentage / 100)
	cgroupResourceLimit := cgroup2.Resources{
		CPU: &cgroup2.CPU{
			Max: cgroup2.NewCPUMax(&quota, &period),
		},
		Memory: &cgroup2.Memory{
			Max: &(t.resourceLimit.MemoryBytes),
		},
	}

	uniqueCGroupName := getUniqueCGroupName()
	resourceManager, err := cgroup2.NewSystemd("/", uniqueCGroupName, -1, &cgroupResourceLimit)
	if err != nil {
		err := resourceManager.DeleteSystemd()
		if err != nil {
			log.Panic(err)
		}
		log.Panic(err)
	}

	// if panic last time, to remove old cgroup.
	err = resourceManager.DeleteSystemd()
	if err != nil {
		log.Panic(err)
	}

	resourceManager, err = cgroup2.NewSystemd("/", uniqueCGroupName, -1, &cgroupResourceLimit)
	if err != nil {
		err := resourceManager.DeleteSystemd()
		if err != nil {
			log.Panic(err)
		}
		log.Panic(err)
	}

	err = resourceManager.AddProc(uint64(t.GetProcessID()))
	if err != nil {
		log.Panic(err)
	}

	fmt.Println("Resource Limit Applied for PID ", t.GetProcessID())
	fmt.Println("Resource Limit ", t.resourceLimit)

	return resourceManager
}

func (t *CMDTask) handleEvent(resourceManager *cgroup2.Manager) {
	eventChan, errorChan := resourceManager.EventChan()
	for {
		select {
		case event, ok := <-eventChan:
			log.Print("From PID ", t.GetProcessID())
			if ok {
				log.Println("memory may exceed limitation, memory event: ", event)
			}
			t.memoryEventHandle()
			return
		case err, ok := <-errorChan:
			log.Print("From PID ", t.GetProcessID())
			if ok {
				log.Println("memory event error:", err)
			}
			t.memoryEventHandle()
			return
		case <-time.After(1 * time.Second):
			log.Println("From PID ", t.GetProcessID(), " Process Killed -- Unknown")
			return
		}
	}
}

func getUniqueCGroupName() string {
	taskCount += 1
	return cgroupPrefix + strconv.FormatUint(taskCount, 10) + cgroupPostfix
}

// GetProcessID
// Return -1 if process not start yet
func (t *CMDTask) GetProcessID() int {
	return t.pid
}
