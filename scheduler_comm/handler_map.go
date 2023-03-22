package scheduler_comm

import (
	"bytes"
	"github.com/luoxiao23333/ProcessResourceLimiter/config"
	"github.com/luoxiao23333/ProcessResourceLimiter/task"
	"log"
	"mime/multipart"
	"net/http"
)

type Handler func(*multipart.Form, string)

var taskRunnerMap *map[string]Handler = nil

func GetHandler(taskName string) Handler {
	if taskRunnerMap == nil {
		taskRunnerMap = &map[string]Handler{
			"slam":  doSlam,
			"mcmot": doMCMOT,
		}
	}

	if taskName != config.GetConfig().TaskName {
		log.Panicf("Not support %v, only support %v", taskName, config.GetConfig().TaskName)
	}

	handler, ok := (*taskRunnerMap)[taskName]
	if !ok {
		log.Panicf("Task name %v is not support!", taskName)
	}

	return handler
}

func doSlam(form *multipart.Form, taskID string) {
	slamTask := task.NewSlamTask()
	outputRoad, info := slamTask.BlockedRun(form)

	body := &bytes.Buffer{}
	multipartWriter := multipart.NewWriter(body)
	addFileToMultipart(outputRoad+"/KeyFrameTrajectory.txt",
		"key_frames", "KeyFrameTrajectory.txt", multipartWriter)

	err := multipartWriter.WriteField("container_output", info)
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

}

func doMCMOT(form *multipart.Form, taskID string) {
	// Complete object detection
	mcmotTask := task.NewMCMOTTask()
	imgRoad, info := mcmotTask.BlockedRun(form)

	body := &bytes.Buffer{}
	multipartWriter := multipart.NewWriter(body)
	addFileToMultipart(imgRoad+"/output.mp4",
		"video", "output.mp4", multipartWriter)
	addFileToMultipart(imgRoad+"/output.txt",
		"bbox_txt", "output.txt", multipartWriter)
	addFileToMultipart(imgRoad+"/output.xlsx",
		"bbox_xlsx", "output.xlsx", multipartWriter)

	err := multipartWriter.WriteField("container_output", info)
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

	_, err = http.Post(schedulerURL+"/mcmot_finish", multipartWriter.FormDataContentType(), body)
	if err != nil {
		log.Panic(err)
	}
}
