class AIScheduleState_t
{
	int32 m_nCurTask;
	TaskStatus_t m_nTaskStatus; // = "TASKSTATUS_NEW"
	GameTime_t m_flTimeStarted;
	GameTime_t m_flTimeCurTaskStarted;
	AI_TaskFailureCode_t m_taskFailureCode; // = "NO_TASK_FAILURE"
	bool m_bScheduleWasInterrupted;
	bool m_bForceScheduleInterrupt;
	int32 m_nStartingTask;
};
