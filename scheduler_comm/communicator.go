package scheduler_comm

import (
	"bytes"
	"encoding/json"
	"github.com/luoxiao23333/ProcessResourceLimiter/task"
	"io"
	"log"
	"net/http"
	"strconv"
	"strings"
)

// TaskSubmissionInfo
// This object represent a new task
type TaskSubmissionInfo struct {
	Command string `json:"command"`
	ID      int    `json:"id"`
}

// TaskInfo
// Contains info of a task
// TaskID unique ID in this node for the task
// ExitInfo Exit code, signal and execution output of this task
type TaskInfo struct {
	TaskID   int           `json:"taskID"`
	ExitInfo task.ExitInfo `json:"exitInfo"`
}

var schedulerURL = "http://localhost:8081"
var resourceLimiterPort = ":8080"

func RunHttpServer() {
	registerToScheduler()

	http.HandleFunc("/run_task", startTask)

	err := http.ListenAndServe(resourceLimiterPort, nil)
	if err != nil {
		log.Panic(err)
	}
}

// registerToScheduler register this worker node to the scheduler
func registerToScheduler() {
	_, err := http.DefaultClient.Post(schedulerURL+"/worker_register", "application/json",
		bytes.NewBuffer([]byte("Node Register Request")))
	if err != nil {
		log.Panic(err)
	}
}

// startTask match "/run_task"
// start a task by a command from the scheduler
// TODO update Get to Post with json struct
func startTask(w http.ResponseWriter, r *http.Request) {
	// Parse http query and command
	rawData, err := io.ReadAll(r.Body)
	if err != nil {
		log.Panic(err)
	}

	var taskInfo TaskSubmissionInfo
	err = json.Unmarshal(rawData, &taskInfo)
	if err != nil {
		log.Panic(err)
	}

	log.Printf("receive task: %v", taskInfo)
	cmdList := strings.Fields(taskInfo.Command)

	var cmdTask = task.NewCMDTask(cmdList[0])
	exitChan := cmdTask.Run(cmdList[1:]...)

	go func() {
		select {
		case exitInfo := <-exitChan:
			taskEnd(taskInfo.ID, exitInfo)
		}
	}()

	_, err = w.Write([]byte(strconv.Itoa(taskInfo.ID)))
	if err != nil {
		log.Panic(err)
	}

}

// taskEnd match "/task_end"
// then a task done, send a http to the scheduler
func taskEnd(taskID int, exitInfo task.ExitInfo) {
	taskInfo := &TaskInfo{
		TaskID:   taskID,
		ExitInfo: exitInfo,
	}

	marshal, err := json.Marshal(taskInfo)
	if err != nil {
		log.Panic(err)
	}

	_, err = http.DefaultClient.Post(schedulerURL+"/task_end", "application/json",
		bytes.NewBuffer(marshal))
	if err != nil {
		log.Println(err)
	}
}
