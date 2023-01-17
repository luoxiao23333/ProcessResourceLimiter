package task

import (
	"bytes"
	"github.com/containerd/cgroups/v3/cgroup2"
	"github.com/docker/go-units"
	"github.com/luoxiao23333/ProcessResourceLimiter/resources"
	"log"
	"os"
	"os/exec"
	"strconv"
	"strings"
	"syscall"
	"time"
)

var taskCount uint64 = 0

const cgroupPrefix string = "Task_Runner"
const cgroupPeriod = 100000
const cgroupPostfix string = ".slice" // must existing for valid unit name

// ExitStatus return process info after the process exited or terminated
type ExitStatus struct {
	Signal os.Signal `json:"signal"`
	Code   int       `json:"code"`
}

// ExitInfo contains all info when a process exit
// Output the std output of the process, which is redirected to the Output filed
type ExitInfo struct {
	ExitStatus `json:"exitStatus"`
	Output     string `json:"output"`
}

type Task interface {
	Run(args ...string) (string, ExitStatus, error)
	GetProcessID() int
}

type CMDTask struct {
	command           string
	pid               int
	resourceLimit     resources.Profile
	memoryEventHandle func(t *CMDTask)

	resourceManager *cgroup2.Manager
	exitChan        chan bool
	procStartTime   time.Time
}

func NewCMDTask(command string, resourceLimit resources.Profile,
	memoryEventHandle func(t *CMDTask)) *CMDTask {
	return &CMDTask{
		command:           command,
		pid:               -1,
		resourceLimit:     resourceLimit,
		memoryEventHandle: memoryEventHandle,
		exitChan:          make(chan bool, 1),
	}
}

// Run the command line in a child process
func (t *CMDTask) Run(args ...string) <-chan ExitInfo {
	cmdOut := bytes.Buffer{}
	cmd := exec.Command(t.command, args...)
	cmd.Stdout = &cmdOut

	if err := cmd.Start(); err != nil {
		log.Panic(err)
	}

	t.pid = cmd.Process.Pid
	t.procStartTime = time.Now()
	t.createResourceLimiter()

	log.Printf("From PID %v, run command {%v}",
		t.pid,
		t.command+" "+strings.Join(args, " "))

	taskFinishChan := make(chan ExitInfo, 1)
	go func() {
		if err := cmd.Wait(); err != nil {
			log.Println("From PID ", t.GetProcessID(), " exit with error:", err)
		}
		t.exitChan <- true

		status := cmd.ProcessState.Sys().(syscall.WaitStatus)

		exitStatus := ExitStatus{
			Code:   status.ExitStatus(),
			Signal: status.Signal(),
		}

		if exitStatus.Signal == syscall.SIGKILL {
			t.handleEvent()
		} else {
			log.Printf("From PID %v, exited with signal: %v, exit code: %v",
				t.GetProcessID(),
				exitStatus.Signal,
				exitStatus.Code)
		}

		err := t.resourceManager.DeleteSystemd()
		if err != nil {
			log.Panic(err)
		}

		taskFinishChan <- ExitInfo{
			ExitStatus: exitStatus,
			Output:     cmdOut.String(),
		}
	}()

	return taskFinishChan
}

// CreateResourcesMonitor
// @param monitorDuration the duration of applying one monitor
// @return metricsChan put metrics into it for each monitor
// @return terminatedChan user put any bool info to terminate the monitor
func (t *CMDTask) CreateResourcesMonitor(monitorDuration time.Duration) (
	<-chan resources.Profile, chan<- bool) {
	metricsChan := make(chan resources.Profile, 1)
	terminatedChan := make(chan bool, 1)

	go func() {
		for {
			select {
			case _, _ = <-t.exitChan:
				return
			case <-time.After(monitorDuration):
				stat, err := t.resourceManager.Stat()
				if err != nil {
					log.Panic("From PID ", t.GetProcessID(), " Resources Monitor Failed!")
				}

				profile := resources.Profile{
					CpuCoresPercentage: stat.CPU.UserUsec * 100 / uint64(time.Since(t.procStartTime).Microseconds()),
					MemoryBytes:        int64(stat.Memory.Usage),
				}

				metricsChan <- profile
			case _, _ = <-terminatedChan:
				return
			}
		}
	}()

	return metricsChan, terminatedChan
}

// createResourceLimiter
// apply resource limit to the process and create a cgroup manager
func (t *CMDTask) createResourceLimiter() {
	period := uint64(cgroupPeriod)
	quota := int64(period * t.resourceLimit.CpuCoresPercentage / 100)
	cgroupResourceLimit := cgroup2.Resources{
		CPU: &cgroup2.CPU{
			Max: cgroup2.NewCPUMax(&quota, &period),
		},
		Memory: &cgroup2.Memory{
			Max: &(t.resourceLimit.MemoryBytes),
		},
	}

	uniqueCGroupName := getUniqueCGroupName()

	var err error
	t.resourceManager, err = cgroup2.NewSystemd("/", uniqueCGroupName, -1, &cgroupResourceLimit)
	if err != nil {
		err := t.resourceManager.DeleteSystemd()
		if err != nil {
			log.Panic(err)
		}
		log.Panic(err)
	}

	err = t.resourceManager.AddProc(uint64(t.GetProcessID()))
	if err != nil {
		log.Panic(err)
	}

	log.Printf("From PID %v Resource Limit Applied: {CPU: %v%% Memory: %v}\n",
		t.GetProcessID(),
		t.resourceLimit.CpuCoresPercentage,
		units.HumanSize(float64(t.resourceLimit.MemoryBytes)))
}

// handleEvent to handle memory event, especially memory limit exceeded
func (t *CMDTask) handleEvent() {
	eventChan, errorChan := t.resourceManager.EventChan()
	for {
		select {
		case event, _ := <-eventChan:
			log.Println("From PID ", t.GetProcessID(),
				"memory may exceed limitation, memory event: ", event)
			t.memoryEventHandle(t)
			return
		case err, _ := <-errorChan:
			log.Println("From PID ", t.GetProcessID(), " memory event error:", err)
			return
		case <-time.After(1 * time.Second):
			log.Println("From PID ", t.GetProcessID(), " Process Killed -- Unknown")
			return
		}
	}
}

// getUniqueCGroupName create unique cgroup for each process
func getUniqueCGroupName() string {
	taskCount += 1
	return cgroupPrefix + strconv.FormatUint(taskCount, 10) + cgroupPostfix
}

// GetProcessID
// Return -1 if process not start yet
func (t *CMDTask) GetProcessID() int {
	return t.pid
}
