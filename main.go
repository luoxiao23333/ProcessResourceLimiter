package main

import (
	"GOProject/resources"
	"GOProject/task"
	"bytes"
	"log"
	"os"
	"os/exec"
	"runtime"
	"strings"
	"sync"
	"time"
)

func main() {
	initLog()

	log.Println("Start Task Runner")
	log.Println("CPU cores number is ", runtime.NumCPU(), getMemAvailable())

	wg := sync.WaitGroup{}
	wg.Add(2)

	go func() {
		runTask(200, 1024*1024*100)
		wg.Done()
	}()

	go func() {
		runTask(100, 1024)
		wg.Done()
	}()

	time.Sleep(1 * time.Second)

	wg.Wait()
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
	monitorChan := cmdTask.CreateResourcesMonitor()

	for {
		select {
		case metrics := <-monitorChan:
			log.Printf("From PID %v, use CPU %v%%, Memory %v\n",
				cmdTask.GetProcessID(),
				metrics.CpuCoresPercentage,
				metrics.MemoryBytes)
		case exitInfo := <-exitChan:
			log.Printf("From PID %v, exited with Signal:{%v}, Code:{%v}, Output{%v}\n",
				cmdTask.GetProcessID(),
				exitInfo.Signal, exitInfo.Code, exitInfo.Output)
			return
		}
	}

}
