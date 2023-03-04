package scheduler_comm

import (
	"bytes"
	"encoding/json"
	"github.com/luoxiao23333/ProcessResourceLimiter/task"
	"io"
	"log"
	"mime/multipart"
	"net/http"
	"os"
	"strings"
	"sync"
)

// TaskSubmissionInfo
// This object represent a new task
type TaskSubmissionInfo struct {
	ID   int    `json:"id"`
	Task string `json:"task"`
}

// TaskInfo
// Contains info of a task
// TaskID unique ID in this node for the task
// ExitInfo Exit code, signal and execution output of this task
type TaskInfo struct {
	TaskID   int           `json:"taskID"`
	ExitInfo task.ExitInfo `json:"exitInfo"`
}

var schedulerURL = "http://192.168.1.101:8081"
var resourceLimiterPort = ":8080"

var dataMap sync.Map

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
	reader, err := r.MultipartReader()
	if err != nil {
		log.Panic(err)
	}

	form, err := reader.ReadForm(1024 * 1024 * 100)
	if err != nil {
		log.Panic(err)
	}

	var taskInfo TaskSubmissionInfo
	err = json.Unmarshal([]byte(form.Value["json"][0]), &taskInfo)
	if err != nil {
		log.Panic(err)
	}

	var body []byte

	log.Printf("receive task: %v", taskInfo)

	if taskInfo.Task == "object_detection" {
		objectDetection(form, taskInfo)

	} else {
		log.Panic("Unsupported Task")
	}

	_, err = w.Write(body)
	if err != nil {
		log.Panic(err)
	}

}

func objectDetection(form *multipart.Form, taskInfo TaskSubmissionInfo) {
	writeFile(form, taskInfo.ID)
	cmdTask := task.NewCMDTask("python3")
	// TODO args...
	args := []string{""}
	exitChan := cmdTask.Run(args...)
	select {
	case exitInfo := <-exitChan:
		// bounding box's xy and ith frame of detected
		outputParams := strings.Fields(exitInfo.Output)
		x := outputParams[0]
		y := outputParams[1]
		frame := outputParams[2]
		body, err := json.Marshal(taskInfo)
		if err != nil {
			log.Panic(err)
		}

		go func() {
			http.Post(schedulerURL + "/new_task")
		}()
	}
}

// get tracking worker url from scheduler
// upload file to worker
func sendTrackingRequest() {

}

func writeFile(form *multipart.Form, taskID int) {
	file, err := form.File["video"][0].Open()
	if err != nil {
		return
	}
	defer func(file multipart.File) {
		err := file.Close()
		if err != nil {

		}
	}(file)

	err = os.Remove("input.avi")
	if err != nil {
		log.Println(err)
	}

	create, err := os.Create("input.avi")
	if err != nil {
		log.Panic(err)
	}

	_, err = io.Copy(create, file)
	if err != nil {
		log.Panic(err)
	}

	log.Println("Task id ", taskID, " Write file ", "input.avi")
}
