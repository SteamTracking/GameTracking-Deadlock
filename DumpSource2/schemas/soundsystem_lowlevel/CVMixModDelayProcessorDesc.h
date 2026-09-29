// MGetKV3ClassDefaults = {
//	"_class": "CVMixModDelayProcessorDesc",
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
//		"m_bPhaseInvert": false,
//		"m_flGlideTime": 0.000000,
//		"m_flDelay": 0.000000,
//		"m_flOutputGain": 0.000000,
//		"m_flFeedbackGain": 0.000000,
//		"m_flModRate": 0.000000,
//		"m_flModDepth": 0.000000,
//		"m_bApplyAntialiasing": false
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
//	},
//	"m_paramModRate":
//	{
//		"m_offset":
//		{
//			"category": "NULL_POINTER",
//			"type": "VO_CHAR",
//			"index": 0
//		}
//	},
//	"m_paramModDepth":
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
class CVMixModDelayProcessorDesc : public CVMixBaseProcessorDesc
{
	VMixModDelayDesc_t m_desc;
	CVMixParameterFloat m_paramCutoffFrequency;
	CVMixParameterFloat m_paramDelay;
	CVMixParameterFloat m_paramModRate;
	CVMixParameterFloat m_paramModDepth;
};
