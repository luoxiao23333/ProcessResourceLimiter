package scheduler_comm

import (
	"bytes"
	"github.com/luoxiao23333/ProcessResourceLimiter/config"
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

func RunHttpServer() {
	port := registerToScheduler()

	http.HandleFunc("/run_task", startTask)

	err := http.ListenAndServe(port, nil)
	if err != nil {
		log.Panic(err)
	}
}

// registerToScheduler register this worker node to the scheduler
func registerToScheduler() string {
	taskName := config.GetConfig().TaskName
	resp, err := http.DefaultClient.Post(schedulerURL+"/worker_register", "text/plain",
		bytes.NewBuffer([]byte(taskName)))
	if err != nil {
		log.Panic(err)
	}

	buffer := &bytes.Buffer{}
	if _, err = io.Copy(buffer, resp.Body); err != nil {
		log.Panic(err)
	}

	port := ":" + buffer.String()

	log.Printf("Register to the Scheduler successfully! Assigned port: %v", port)
	return port
}

// startTask match "/run_task"
// start a task by a command from the scheduler
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

	handler := GetHandler(taskName)

	go handler(form, taskID)

	_, err = w.Write([]byte("Task Received!"))
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
