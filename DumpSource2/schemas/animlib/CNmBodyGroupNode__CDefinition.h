// MGetKV3ClassDefaults = {
//	"_class": "CNmBodyGroupNode::CDefinition",
//	"m_nNodeIdx": -1,
//	"m_nChildNodeIdx": -1,
//	"m_nEnabledNodeIdx": -1,
//	"m_event":
//	{
//		"_class": "CNmBodyGroupEvent",
//		"m_flStartTime":
//		{
//			"m_flValue": 0.000000
//		},
//		"m_flDuration":
//		{
//			"m_flValue": 0.000000
//		},
//		"m_syncID": "",
//		"m_target": "Self",
//		"m_groupName": "",
//		"m_choiceName": ""
//	}
//}
// MHasKV3TransferPolymorphicClassname
class CNmBodyGroupNode::CDefinition : public CNmPassthroughNode::CDefinition
{
	int16 m_nEnabledNodeIdx;
	CNmBodyGroupEvent m_event;
};
