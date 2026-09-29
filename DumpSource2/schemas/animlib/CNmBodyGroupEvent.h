// MGetKV3ClassDefaults = {
//	"_class": "CNmBodyGroupEvent",
//	"m_flStartTime":
//	{
//		"m_flValue": 0.000000
//	},
//	"m_flDuration":
//	{
//		"m_flValue": 0.000000
//	},
//	"m_syncID": "",
//	"m_target": "Self",
//	"m_groupName": "",
//	"m_choiceName": ""
//}
// MHasKV3TransferPolymorphicClassname
class CNmBodyGroupEvent : public CNmEvent
{
	CNmEventTargetEntity_t m_target;
	CUtlString m_groupName;
	CUtlString m_choiceName;
};
