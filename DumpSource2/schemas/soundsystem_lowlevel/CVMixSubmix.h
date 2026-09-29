// MGetKV3ClassDefaults = {
//	"m_name": "",
//	"m_SendNames":
//	[
//		"",
//		"",
//		"",
//		""
//	],
//	"m_nSoloNameHash": 0,
//	"m_nChannels": -1,
//	"m_nSendOperator": "NAMED_SEND",
//	"m_nMixDownRule": "SUM"
//}
class CVMixSubmix
{
	CUtlString m_name;
	CUtlString[4] m_SendNames;
	uint32 m_nSoloNameHash;
	int32 m_nChannels;
	// MPropertyFriendlyName = "Send Operator"
	VMixSendOperator_t m_nSendOperator;
	VMixMixDownRule_t m_nMixDownRule;
};
