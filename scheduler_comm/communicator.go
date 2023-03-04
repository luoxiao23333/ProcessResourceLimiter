package scheduler_comm

import (
	"bytes"
	"encoding/json"
	"github.com/luoxiao23333/ProcessResourceLimiter/task"
	"github.com/luoxiao23333/ProcessResourceLimiter/utils"
	"io"
	"log"
	"net/http"
	"os"
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

var zipPath = "temp.zip"

var waitingTrackingImages chan bool

func RunHttpServer() {
	registerToScheduler()

	http.HandleFunc("/run_task", startTask)
	http.HandleFunc("tracking_upload", trackingUpload)

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
		// Complete object detection
		obTask := task.NewObjectDetectionTask()
		imgRoad, info := obTask.BlockedRun(form)

		// After detection, get tracking input, notify the scheduler
		resp, err := http.Post(schedulerURL, "text/plain", bytes.NewBuffer([]byte(info)))
		if err != nil {
			log.Panic(err)
		}

		// Get tracking worker url, send images to the tracker
		trackingUrl, err := io.ReadAll(resp.Body)
		if err != nil {
			log.Panic(err)
		}

		utils.Zip(imgRoad, zipPath)
		file, err := os.ReadFile(zipPath)
		if err != nil {
			log.Panic(err)
		}
		_, err = http.Post(string(trackingUrl),
			"application/octet-stream", bytes.NewReader(file))
		if err != nil {
			log.Panic(err)
		}

		// TODO
		// After object detection, send what to the scheduler
		// May can tell scheduler that how many tracking subtask it has

	} else if taskInfo.Task == "tracking" {
		trackingTask := task.NewTrackingTask()

		// wait for object detection worker upload images
		waitingTrackingImages = make(chan bool)
		_ = <-waitingTrackingImages
		imageRoad, trackingInfo := trackingTask.BlockedRun(form.Value["pythonInfo"][0])
		// TODO
		// After tracking, send what to the scheduler
	} else {
		log.Panic("Unsupported Task")
	}

	_, err = w.Write(body)
	if err != nil {
		log.Panic(err)
	}

}

func trackingUpload(w http.ResponseWriter, r *http.Request) {
	// receive images from object detection, unzip and notify tracking task to start
	create, err := os.Create(zipPath)
	if err != nil {
		log.Panic(err)
	}

	_, err = io.Copy(create, r.Body)
	if err != nil {
		log.Panic(err)
	}

	utils.UnZIP(zipPath, "input")

	waitingTrackingImages <- true
}
