// MGetKV3ClassDefaults = {
//	"_class": "CVMixSteamAudioHybridReverbProcessorDesc",
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
//	"m_paramReverbTimeLow":
//	{
//		"m_offset":
//		{
//			"category": "NULL_POINTER",
//			"type": "VO_CHAR",
//			"index": 0
//		}
//	},
//	"m_paramReverbTimeMid":
//	{
//		"m_offset":
//		{
//			"category": "NULL_POINTER",
//			"type": "VO_CHAR",
//			"index": 0
//		}
//	},
//	"m_paramReverbTimeHigh":
//	{
//		"m_offset":
//		{
//			"category": "NULL_POINTER",
//			"type": "VO_CHAR",
//			"index": 0
//		}
//	},
//	"m_paramBand":
//	{
//		"m_offset":
//		{
//			"category": "NULL_POINTER",
//			"type": "VO_CHAR",
//			"index": 0
//		}
//	},
//	"m_paramReverbTime":
//	{
//		"category": "NULL_POINTER",
//		"type": "VO_CHAR",
//		"index": 0
//	}
//}
// MHasKV3TransferPolymorphicClassname
class CVMixSteamAudioHybridReverbProcessorDesc : public CVMixBaseProcessorDesc
{
	CVMixParameterFloat m_paramReverbTimeLow;
	CVMixParameterFloat m_paramReverbTimeMid;
	CVMixParameterFloat m_paramReverbTimeHigh;
	CVMixParameterFloat m_paramBand;
	CVMixDataOffset m_paramReverbTime;
};
