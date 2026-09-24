// MGetKV3ClassDefaults = {
//	"_class": "CExpressionActionUpdater",
//	"m_hParam":
//	{
//		"m_type": "ANIMPARAM_UNKNOWN",
//		"m_index": 255
//	},
//	"m_eParamType": "ANIMPARAM_UNKNOWN",
//	"m_hScript":
//	{
//		"m_id": 0
//	}
//}
// MHasKV3TransferPolymorphicClassname
class CExpressionActionUpdater : public CAnimActionUpdater
{
	CAnimParamHandle m_hParam;
	AnimParamType_t m_eParamType;
	AnimScriptHandle m_hScript;
};
