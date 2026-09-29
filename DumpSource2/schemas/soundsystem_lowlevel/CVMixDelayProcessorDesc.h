// MGetKV3ClassDefaults = {
//	"_class": "CVMixDelayProcessorDesc",
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
//		"m_feedbackFilter":
//		{
//			"m_fldbGain": 0.000000,
//			"m_flCutoffFreq": 1000.000000,
//			"m_flQ": 0.707107,
//			"m_nFilterType": "FILTER_UNKNOWN",
//			"m_nFilterSlope": "FILTER_SLOPE_12dB",
//			"m_bEnabled": true
//		},
//		"m_bEnableFilter": false,
//		"m_flDelay": 0.000000,
//		"m_flDirectGain": 0.000000,
//		"m_flDelayGain": 0.000000,
//		"m_flFeedbackGain": 0.000000,
//		"m_flWidth": 0.000000
//	},
//	"m_paramCutoffFrequency":
//	{
//		"m_offset":
//		{
//			"category": "NULL_POINTER",
//			"type": "VO_CHAR",
//			"index": 0
//		}
//	},
//	"m_paramDelay":
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
class CVMixDelayProcessorDesc : public CVMixBaseProcessorDesc
{
	VMixDelayDesc_t m_desc;
	CVMixParameterFloat m_paramCutoffFrequency;
	CVMixParameterFloat m_paramDelay;
};
