// MGetKV3ClassDefaults = {
//	"_class": "CVirtualAnimParameter",
//	"m_name": "Unnamed Parameter",
//	"m_sComment": "",
//	"m_group": "",
//	"m_id":
//	{
//		"m_id": 0
//	},
//	"m_componentName": "",
//	"m_bNetworkingRequested": false,
//	"m_bIsReferenced": false,
//	"m_expressionString": "",
//	"m_eParamType": "ANIMPARAM_FLOAT"
//}
// MHasKV3TransferPolymorphicClassname
class CVirtualAnimParameter : public CAnimParameterBase
{
	CUtlString m_expressionString;
	AnimParamType_t m_eParamType;
};
