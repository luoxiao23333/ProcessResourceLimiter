package main

import (
	"bytes"
	"encoding/json"
	"github.com/docker/go-units"
	"github.com/luoxiao23333/ProcessResourceLimiter/resources"
	"github.com/luoxiao23333/ProcessResourceLimiter/task"
	"log"
	"net/http"
	"os"
	"os/exec"
	"runtime"
	"strconv"
	"strings"
	"time"
)

var metricsChanMap = make(map[uint64]resources.Profile)
var httpPort = ":30000"

func main() {
	initLog()

	log.Println("Start Task Runner")
	log.Println("CPU cores number is ", runtime.NumCPU(), getMemAvailable())

	http.HandleFunc("/run_task", startTask)
	http.HandleFunc("/metrics_query", metricsQuery)
	err := http.ListenAndServe("localhost:8080", nil)
	if err != nil {
		log.Panic(err)
	}

}

func startTask(w http.ResponseWriter, r *http.Request) {
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

	var resourcesLimit = resources.NewResources(uint64(cpu), int64(mem))
	var cmdTask = task.NewCMDTask(cmdList[0], *resourcesLimit, func(t *task.CMDTask) {
		log.Println("From PID ", t.GetProcessID(), "task has been killed due to memory event")
	})
	exitChan := cmdTask.Run(cmdList[1:]...)
	monitorChan, _ := cmdTask.CreateResourcesMonitor(1 * time.Second)

	taskId := GetUniqueNumber()
	_, err = w.Write([]byte(strconv.Itoa(int(taskId))))
	if err != nil {
		log.Panic(err)
	}

	go func() {
		for {
			select {
			case metrics := <-monitorChan:
				log.Printf("From PID %v, use CPU %v%%, Memory %v\n",
					cmdTask.GetProcessID(),
					metrics.CpuCoresPercentage,
					units.HumanSize(float64(metrics.MemoryBytes)))
				metricsChanMap[taskId] = metrics
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

type TaskInfo struct {
	TaskID   uint64        `json:"taskID"`
	ExitInfo task.ExitInfo `json:"exitInfo"`
}

func taskEnd(taskID uint64, exitInfo task.ExitInfo) {
	taskInfo := &TaskInfo{
		TaskID:   taskID,
		ExitInfo: exitInfo,
	}

	delete(metricsChanMap, taskID)

	marshal, err := json.Marshal(taskInfo)
	if err != nil {
		log.Panic(err)
	}

	_, err = http.DefaultClient.Post("http://localhost:8081", "application/json",
		bytes.NewBuffer(marshal))
	if err != nil {
		log.Println(err)
	}
}

func metricsQuery(w http.ResponseWriter, r *http.Request) {
	taskID, _ := strconv.Atoi(r.URL.Query().Get("taskID"))
	marshal, err := json.Marshal(metricsChanMap[uint64(taskID)])
	if err != nil {
		log.Panic(err)
	}

	_, err = w.Write(marshal)
	if err != nil {
		log.Panic(err)
	}
}

func getMemAvailable() string {
	cmd := exec.Command("cat", "/proc/meminfo")
	output := bytes.Buffer{}
	cmd.Stdout = &output
	err := cmd.Run()
	if err != nil {
		log.Panic(err)
	}

	memInfoList := strings.Split(output.String(), "\n")
	for i := 0; i < len(memInfoList); i++ {
		if strings.Contains(memInfoList[i], "MemAvailable") {
			return memInfoList[i]
		}
	}

	return "Available Meminfo Read Failed"
}

func initLog() {
	logFile, err := os.OpenFile("task_runner.log", os.O_CREATE|os.O_WRONLY|os.O_TRUNC, 0644)
	if err != nil {
		panic(err)
	}
	log.SetOutput(logFile)
}

func runTask(cpu uint64, mem int64) {
	var resourcesLimit = resources.NewResources(cpu, mem)
	var cmdTask = task.NewCMDTask("python", *resourcesLimit, func(t *task.CMDTask) {
		log.Println("From PID ", t.GetProcessID(), "task has been killed due to memory event")
	})
	exitChan := cmdTask.Run("test.py")
	monitorChan, _ := cmdTask.CreateResourcesMonitor(1 * time.Second)

	for {
		select {
		case metrics := <-monitorChan:
			log.Printf("From PID %v, use CPU %v%%, Memory %v\n",
				cmdTask.GetProcessID(),
				metrics.CpuCoresPercentage,
				units.HumanSize(float64(metrics.MemoryBytes)))
		case exitInfo := <-exitChan:
			log.Printf("From PID %v, exited with Signal:{%v}, Code:{%v}, Output{%v}\n",
				cmdTask.GetProcessID(),
				exitInfo.Signal, exitInfo.Code, exitInfo.Output)
			return
		}
	}

}

var uniqueNumber uint64 = 0

func GetUniqueNumber() uint64 {
	uniqueNumber += 1
	return uniqueNumber
}
