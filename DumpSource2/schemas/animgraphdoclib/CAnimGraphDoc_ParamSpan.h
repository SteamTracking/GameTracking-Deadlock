// MGetKV3ClassDefaults = {
//	"_class": "CAnimGraphDoc_ParamSpan",
//	"m_samples":
//	[
//	],
//	"m_paramName": "",
//	"m_id":
//	{
//		"m_id": 0
//	},
//	"m_flStartCycle": 0.000000,
//	"m_flEndCycle": 1.000000
//}
// MHasKV3TransferPolymorphicClassname
class CAnimGraphDoc_ParamSpan
{
	CUtlVector< CAnimGraphDoc_ParamSpanSample > m_samples;
	// MPropertyHideField
	CUtlString m_paramName;
	AnimParamID m_id;
	float32 m_flStartCycle;
	float32 m_flEndCycle;
};
