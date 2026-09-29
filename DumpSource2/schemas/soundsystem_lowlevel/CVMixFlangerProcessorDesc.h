// MGetKV3ClassDefaults = {
//	"_class": "CVMixFlangerProcessorDesc",
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
//		"m_bPhaseInvert": false,
//		"m_flGlideTime": 0.000000,
//		"m_flDelay": 0.000000,
//		"m_flOutputGain": 0.000000,
//		"m_flFeedbackGain": 0.000000,
//		"m_flFeedforwardGain": 0.000000,
//		"m_flModRate": 0.000000,
//		"m_flModDepth": 0.000000,
//		"m_bApplyAntialiasing": false
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
class CVMixFlangerProcessorDesc : public CVMixBaseProcessorDesc
{
	VMixFlangerDesc_t m_desc;
	CVMixParameterFloat m_paramDelay;
	CVMixParameterFloat m_paramModRate;
	CVMixParameterFloat m_paramModDepth;
};
