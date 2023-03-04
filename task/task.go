package task

import (
	"bytes"
	"log"
	"os"
	"os/exec"
	"strings"
	"syscall"
)

const cgroupPrefix string = "TaskRunner"
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
	command string
	pid     int

	exitChan chan bool
}

func NewCMDTask(command string) *CMDTask {
	return &CMDTask{
		command:  command,
		pid:      -1,
		exitChan: make(chan bool, 1),
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

		log.Printf("From PID %v, exited with signal: %v, exit code: %v",
			t.GetProcessID(),
			exitStatus.Signal,
			exitStatus.Code)

		taskFinishChan <- ExitInfo{
			ExitStatus: exitStatus,
			Output:     cmdOut.String(),
		}
	}()

	return taskFinishChan
}

// GetProcessID
// Return -1 if process not start yet
func (t *CMDTask) GetProcessID() int {
	return t.pid
}
