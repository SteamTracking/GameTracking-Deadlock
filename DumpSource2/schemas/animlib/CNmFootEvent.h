// MGetKV3ClassDefaults = {
//	"_class": "CNmFootEvent",
//	"m_flStartTime":
//	{
//		"m_flValue": 0.000000
//	},
//	"m_flDuration":
//	{
//		"m_flValue": 0.000000
//	},
//	"m_syncID": "",
//	"m_phase": "LeftFootDown"
//}
// MHasKV3TransferPolymorphicClassname
class CNmFootEvent : public CNmEvent
{
	NmFootPhase_t m_phase;
};
