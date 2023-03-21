package scheduler_comm

import (
	"bytes"
	"github.com/luoxiao23333/ProcessResourceLimiter/task"
	"io"
	"log"
	"mime/multipart"
	"net/http"
	"os"
)

// TaskInfo
// Contains info of a task
// TaskID unique ID in this node for the task
// ExitInfo Exit code, signal and execution output of this task
type TaskInfo struct {
	TaskID   int           `json:"taskID"`
	ExitInfo task.ExitInfo `json:"exitInfo"`
}

var schedulerURL = "http://192.168.1.101:8081"
var resourceLimiterPort = ":8082"

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

	taskName := form.Value["task_name"][0]
	taskID := form.Value["task_id"][0]

	log.Printf("receive task: %v, id: %v", taskName, taskID)

	if taskName == "slam" {
		go func() {
			// Complete object detection
			slamTask := task.NewSlamTask()
			outputRoad, info := slamTask.BlockedRun(form)

			body := &bytes.Buffer{}
			multipartWriter := multipart.NewWriter(body)
			addFileToMultipart(outputRoad+"/KeyFrameTrajectory.txt",
				"key_frames", "KeyFrameTrajectory.txt", multipartWriter)

			err = multipartWriter.WriteField("container_output", info)
			if err != nil {
				log.Panic(err)
			}

			err = multipartWriter.WriteField("task_id", taskID)
			if err != nil {
				log.Panic(err)
			}

			err = multipartWriter.Close()
			if err != nil {
				log.Panic(err)
			}

			_, err = http.Post(schedulerURL+"/slam_finish", multipartWriter.FormDataContentType(), body)
			if err != nil {
				log.Panic(err)
			}

		}()
	} else {
		_, err = w.Write([]byte("Unsupported Task"))
		if err != nil {
			log.Panic(err)
		}
		log.Panic("Unsupported Task")
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
