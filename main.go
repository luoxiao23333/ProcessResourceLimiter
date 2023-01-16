package main

import (
	"GOProject/resources"
	"GOProject/task"
	"fmt"
	"log"
	"os"
	"runtime"
	"sync"
	"time"
)

func main() {
	initLog()

	log.Println("Start Task Runner")
	log.Println("CPU number is ", runtime.NumCPU())
	memStats := &runtime.MemStats{}
	runtime.ReadMemStats(memStats)
	log.Println("Memory is ", memStats.Sys, "Bytes")

	wg := sync.WaitGroup{}
	wg.Add(2)

	go func() {
		runTask(70, 1024)
		wg.Done()
	}()

	go func() {
		runTask(100, 1024*1024*1024)
		wg.Done()
	}()

	time.Sleep(1 * time.Second)

	wg.Wait()
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
	var cmdTask = task.NewCMDTask("python", *resourcesLimit, func() {
		fmt.Print("Hahaha memory Exceeded!")
	})
	result, exitStatus, err := cmdTask.Run("test.py")
	if err != nil {
		log.Println(err, exitStatus)
	} else {
		log.Printf("From Process %v, Output %v\n", cmdTask.GetProcessID(), result)
	}
}
