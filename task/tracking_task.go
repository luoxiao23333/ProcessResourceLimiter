package task

var (
	trackingCMD  = ""
	trackingArgs = []string{""}
	imagesRoad   = "output/"
)

type TrackingTask struct {
	*CMDTask
}

func NewTrackingTask() *TrackingTask {
	task := &TrackingTask{
		CMDTask: NewCMDTask(trackingCMD),
	}
	return task
}

func (task *TrackingTask) BlockedRun(pythonInfo string) (imageRoad, trackingInfo string) {
	args := append(trackingArgs, pythonInfo)
	exitChan := task.CMDTask.Run(args...)

	select {
	case exitInfo, _ := <-exitChan:
		imageRoad = imagesRoad
		trackingInfo = exitInfo.Output
		return imagesRoad, trackingInfo
	}
}
