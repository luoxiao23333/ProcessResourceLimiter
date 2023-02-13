package scheduler_comm

import (
	"bytes"
	"encoding/json"
	"github.com/docker/go-units"
	"github.com/luoxiao23333/ProcessResourceLimiter/resources"
	"github.com/luoxiao23333/ProcessResourceLimiter/task"
	"io"
	"log"
	"net/http"
	"strconv"
	"strings"
	"time"
)

// TaskSubmissionInfo
// This object represent a new task
type TaskSubmissionInfo struct {
	CPU     int    `json:"cpu"`
	Mem     int    `json:"mem"`
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

// metricsMap map from taskID to its resources metrics result
var metricsMap = make(map[int]resources.Profile)

var schedulerURL = "http://192.168.0.101:8081"
var resourceLimiterPort = ":8080"

var metricsSampleInterval = 1 * time.Second

func RunHttpServer() {
	registerToScheduler()

	http.HandleFunc("/run_task", startTask)
	http.HandleFunc("/metrics_query", metricsQuery)

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

	// create task with resource limit
	var resourcesLimit = resources.NewResources(uint64(taskInfo.CPU), int64(taskInfo.Mem))
	var cmdTask = task.NewCMDTask(cmdList[0], *resourcesLimit, func(t *task.CMDTask) {
		log.Println("From PID ", t.GetProcessID(), "task has been killed due to memory event")
	})
	exitChan := cmdTask.Run(cmdList[1:]...)
	monitorChan, _ := cmdTask.CreateResourcesMonitor(metricsSampleInterval)

	_, err = w.Write([]byte(strconv.Itoa(taskInfo.ID)))
	if err != nil {
		log.Panic(err)
	}

	// monitor resource metrics and task exiting event
	go func() {
		for {
			select {
			case metrics := <-monitorChan:
				log.Printf("From PID %v, use CPU %v%%, Memory %v\n",
					cmdTask.GetProcessID(),
					metrics.CpuCoresPercentage,
					units.HumanSize(float64(metrics.MemoryBytes)))
				metricsMap[taskInfo.ID] = metrics
			case exitInfo := <-exitChan:
				log.Printf("From PID %v, exited with Signal:{%v}, Code:{%v}, Output{%v}\n",
					cmdTask.GetProcessID(),
					exitInfo.Signal, exitInfo.Code, exitInfo.Output)
				taskEnd(taskInfo.ID, exitInfo)
				return
			}
		}
	}()

}

// taskEnd match "/task_end"
// then a task done, send a http to the scheduler
func taskEnd(taskID int, exitInfo task.ExitInfo) {
	taskInfo := &TaskInfo{
		TaskID:   taskID,
		ExitInfo: exitInfo,
	}

	delete(metricsMap, taskID)

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

// metricsQuery match "/metrics_query"
// return latest metrics sample result to the scheduler
// Note: the metrics is sampled by the monitor per metricsSampleInterval
func metricsQuery(w http.ResponseWriter, r *http.Request) {
	taskID, _ := strconv.Atoi(r.URL.Query().Get("taskID"))
	marshal, err := json.Marshal(metricsMap[taskID])
	if err != nil {
		log.Panic(err)
	}

	_, err = w.Write(marshal)
	if err != nil {
		log.Panic(err)
	}
}
