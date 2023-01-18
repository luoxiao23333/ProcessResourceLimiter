package scheduler_comm

import (
	"bytes"
	"encoding/json"
	"github.com/docker/go-units"
	"github.com/luoxiao23333/ProcessResourceLimiter/resources"
	"github.com/luoxiao23333/ProcessResourceLimiter/task"
	"log"
	"net/http"
	"strconv"
	"strings"
	"time"
)

// TaskInfo
// Contains info of a task
// TaskID unique ID in this node for the task
// ExitInfo Exit code, signal and execution output of this task
type TaskInfo struct {
	TaskID   uint64        `json:"taskID"`
	ExitInfo task.ExitInfo `json:"exitInfo"`
}

// metricsMap map from taskID to its resources metrics result
var metricsMap = make(map[uint64]resources.Profile)

var schedulerURL = "http://localhost:8081"
var resourceLimiterPort = ":8080"

var metricsSampleInterval = 1 * time.Second

func RunHttpServer() {
	http.HandleFunc("/run_task", startTask)
	http.HandleFunc("/metrics_query", metricsQuery)

	err := http.ListenAndServe(resourceLimiterPort, nil)
	if err != nil {
		log.Panic(err)
	}
}

// startTask match "/run_task"
// start a task by a command from the scheduler
// TODO update Get to Post with json struct
func startTask(w http.ResponseWriter, r *http.Request) {
	// Parse http query and command
	query := r.URL.Query()
	command := query.Get("command")
	cpu, err := strconv.Atoi(query.Get("cpu"))
	if err != nil {
		log.Panic(err)
	}
	mem, err := strconv.Atoi(query.Get("mem"))
	if err != nil {
		log.Panic(err)
	}
	cmdList := strings.Fields(command)

	// create task with resource limit
	var resourcesLimit = resources.NewResources(uint64(cpu), int64(mem))
	var cmdTask = task.NewCMDTask(cmdList[0], *resourcesLimit, func(t *task.CMDTask) {
		log.Println("From PID ", t.GetProcessID(), "task has been killed due to memory event")
	})
	exitChan := cmdTask.Run(cmdList[1:]...)
	monitorChan, _ := cmdTask.CreateResourcesMonitor(metricsSampleInterval)

	taskId := getUniqueNumber()
	_, err = w.Write([]byte(strconv.Itoa(int(taskId))))
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
				metricsMap[taskId] = metrics
			case exitInfo := <-exitChan:
				log.Printf("From PID %v, exited with Signal:{%v}, Code:{%v}, Output{%v}\n",
					cmdTask.GetProcessID(),
					exitInfo.Signal, exitInfo.Code, exitInfo.Output)
				taskEnd(taskId, exitInfo)
				return
			}
		}
	}()

}

var uniqueNumber uint64 = 0

func getUniqueNumber() uint64 {
	uniqueNumber += 1
	return uniqueNumber
}

// taskEnd match "/task_end"
// then a task done, send a http to the scheduler
func taskEnd(taskID uint64, exitInfo task.ExitInfo) {
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
	marshal, err := json.Marshal(metricsMap[uint64(taskID)])
	if err != nil {
		log.Panic(err)
	}

	_, err = w.Write(marshal)
	if err != nil {
		log.Panic(err)
	}
}
