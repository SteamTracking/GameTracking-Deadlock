// MGetKV3ClassDefaults = {
//	"_class": "CVMixDiffusorProcessorDesc",
//	"m_name": "",
//	"m_nDebugId": 0,
//	"m_flxfade": 0.100000,
//	"m_nChannels": -1,
//	"m_bDebugBypass": false,
//	"m_paramEnable":
//	{
//		"m_offset":
//		{
//			"category": "NULL_POINTER",
//			"type": "VO_CHAR",
//			"index": 0
//		}
//	},
//	"m_paramMix":
//	{
//		"m_offset":
//		{
//			"category": "NULL_POINTER",
//			"type": "VO_CHAR",
//			"index": 0
//		}
//	},
//	"m_desc":
//	{
//		"m_flSize": 0.000000,
//		"m_flComplexity": 0.000000,
//		"m_flFeedback": 0.000000,
//		"m_flOutputGain": 0.000000
//	}
//}
// MHasKV3TransferPolymorphicClassname
class CVMixDiffusorProcessorDesc : public CVMixBaseProcessorDesc
{
	VMixDiffusorDesc_t m_desc;
};
