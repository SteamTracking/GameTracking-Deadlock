class AISchedulerSave_t
{
	int16 nVersion; // = 1
	uint32 scheduleCrc;
	char[128] szSchedule;
	char[128] szUntranslatedSchedule;
	char[128] szFailSchedule;
};
