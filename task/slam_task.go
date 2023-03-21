package task

import (
	"io"
	"log"
	"mime/multipart"
	"os"
)

var (
	slamCMD  = "bash"
	slamArgs = []string{"/ORB_SLAM2/run.sh"}
	slamRoad = ""
)

type SlamTask struct {
	*CMDTask
}

func NewSlamTask() *SlamTask {
	task := &SlamTask{
		CMDTask: NewCMDTask(slamCMD),
	}
	return task
}

func (task *SlamTask) BlockedRun(form *multipart.Form) (
	outputRoad, slamInfo string) {
	writeSlamInputFile(form)
	exitChan := task.CMDTask.Run(slamArgs...)

	select {
	case exitInfo, _ := <-exitChan:
		outputRoad = slamRoad
		slamInfo = exitInfo.Output
		return outputRoad, slamInfo
	}
}

func writeSlamInputFile(form *multipart.Form) {
	file, err := form.File["video"][0].Open()
	if err != nil {
		log.Panic(err)
	}
	defer func(file multipart.File) {
		err = file.Close()
		if err != nil {
			log.Panic(err)
		}
	}(file)

	create, err := os.Create("/ORB_SLAM2/input.mp4")
	if err != nil {
		log.Panic(err)
	}

	_, err = io.Copy(create, file)
	if err != nil {
		log.Panic(err)
	}

	err = create.Close()
	if err != nil {
		log.Panic(err)
	}

	log.Println(" Write file ", "input.mp4")
}
