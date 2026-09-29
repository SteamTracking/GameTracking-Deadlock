// MGetKV3ClassDefaults = {
//	"m_nCurTask": 0,
//	"m_nTaskStatus": "TASKSTATUS_NEW",
//	"m_flTimeStarted": null,
//	"m_flTimeCurTaskStarted": null,
//	"m_taskFailureCode": "NO_TASK_FAILURE",
//	"m_bScheduleWasInterrupted": false,
//	"m_bForceScheduleInterrupt": false,
//	"m_nStartingTask": 0
//}
class AIScheduleState_t
{
	int32 m_nCurTask;
	TaskStatus_t m_nTaskStatus;
	GameTime_t m_flTimeStarted;
	GameTime_t m_flTimeCurTaskStarted;
	AI_TaskFailureCode_t m_taskFailureCode;
	bool m_bScheduleWasInterrupted;
	bool m_bForceScheduleInterrupt;
	int32 m_nStartingTask;
};
