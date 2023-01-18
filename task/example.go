package task

import (
	"github.com/docker/go-units"
	"github.com/luoxiao23333/ProcessResourceLimiter/resources"
	"log"
	"time"
)

// RunTask
// An example method guide you how to use resource limiter to start a new process
// This example method exec "python test.py" in a resource limit manner
func RunTask(cpu uint64, mem int64) {
	var resourcesLimit = resources.NewResources(cpu, mem)
	var cmdTask = NewCMDTask("python", *resourcesLimit, func(t *CMDTask) {
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
