// MGetKV3ClassDefaults = {
//	"_class": "CVMixFilterProcessorDesc",
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
//		"m_fldbGain": 0.000000,
//		"m_flCutoffFreq": 1000.000000,
//		"m_flQ": 0.707107,
//		"m_nFilterType": "FILTER_UNKNOWN",
//		"m_nFilterSlope": "FILTER_SLOPE_12dB",
//		"m_bEnabled": true
//	},
//	"m_paramCutoffFreq":
//	{
//		"m_offset":
//		{
//			"category": "NULL_POINTER",
//			"type": "VO_CHAR",
//			"index": 0
//		}
//	},
//	"m_paramQ":
//	{
//		"m_offset":
//		{
//			"category": "NULL_POINTER",
//			"type": "VO_CHAR",
//			"index": 0
//		}
//	}
//}
// MHasKV3TransferPolymorphicClassname
class CVMixFilterProcessorDesc : public CVMixBaseProcessorDesc
{
	VMixFilterDesc_t m_desc;
	CVMixParameterFloat m_paramCutoffFreq;
	CVMixParameterFloat m_paramQ;
};
