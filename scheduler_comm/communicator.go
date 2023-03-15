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

		multipartWriter := multipart.NewWriter(w)
		addFileToMultipart(imgRoad+"/output.mp4",
			"video", "output.mp4", multipartWriter)
		addFileToMultipart(imgRoad + "/output.txt",
			"bbox_txt", "output.txt", multipartWriter)
		addFileToMultipart(imgRoad + "/output.xlsx",
			"bbox_xlsx", "output.xlsx", multipartWriter)

		err = multipartWriter.WriteField("container_output", info)
		if err != nil {
			log.Panic(err)
		}

	} else {
		log.Panic("Unsupported Task")
	}

	_, err = w.Write(body)
	if err != nil {
		log.Panic(err)
	}

}

func addFileToMultipart(filePath, fieldName, fileName string, multipartWriter *multipart.Writer) {
	file, err := os.Open(filePath)
	if err != nil {
		log.Panic(err)
	}
	writer, err := multipartWriter.CreateFormFile(fieldName, fileName)
	_, err = io.Copy(writer, file)
	if err != nil {
		log.Panic(err)
	}
}
