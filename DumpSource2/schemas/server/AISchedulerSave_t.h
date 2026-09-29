// MGetKV3ClassDefaults = {
//	"nVersion": 1,
//	"scheduleCrc": 0,
//	"szSchedule": "",
//	"szUntranslatedSchedule": "",
//	"szFailSchedule": ""
//}
class AISchedulerSave_t
{
	int16 nVersion;
	uint32 scheduleCrc;
	char[128] szSchedule;
	char[128] szUntranslatedSchedule;
	char[128] szFailSchedule;
};
