// MConstructibleClassBase
class CAI_Scheduler : public CAI_Component
{
	AIScheduleState_t m_ScheduleState;
	// MNotSaved
	ScheduleId_t m_failSchedule;
	// MNotSaved
	ScheduleId_t m_translatedSchedule;
	// MNotSaved
	ScheduleId_t m_untranslatedSchedule;
	// MNotSaved
	CUtlString m_sInterruptText;
};
