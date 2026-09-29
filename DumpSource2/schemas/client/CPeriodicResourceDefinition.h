// MGetKV3ClassDefaults = {
//	"m_unPeriodicResourceID": 0,
//	"m_rtStartTimestamp": 0,
//	"m_rtEndTimestamp": 0,
//	"m_unPeriodDuration": 0,
//	"m_unDefaultMaxValue": 0,
//	"m_bExtendInitialPeriod": false
//}
class CPeriodicResourceDefinition
{
	PeriodicResourceID_t m_unPeriodicResourceID;
	uint32 m_rtStartTimestamp;
	uint32 m_rtEndTimestamp;
	uint32 m_unPeriodDuration;
	uint32 m_unDefaultMaxValue;
	bool m_bExtendInitialPeriod;
};
