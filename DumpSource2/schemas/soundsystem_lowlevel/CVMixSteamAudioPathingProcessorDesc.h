// MGetKV3ClassDefaults = {
//	"_class": "CVMixSteamAudioPathingProcessorDesc",
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
//	"m_paramPositionX":
//	{
//		"m_offset":
//		{
//			"category": "NULL_POINTER",
//			"type": "VO_CHAR",
//			"index": 0
//		}
//	},
//	"m_paramPositionY":
//	{
//		"m_offset":
//		{
//			"category": "NULL_POINTER",
//			"type": "VO_CHAR",
//			"index": 0
//		}
//	},
//	"m_paramPositionZ":
//	{
//		"m_offset":
//		{
//			"category": "NULL_POINTER",
//			"type": "VO_CHAR",
//			"index": 0
//		}
//	},
//	"m_paramPathingMixLevel":
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
//	"m_paramArrayPathingEQ":
//	{
//		"category": "NULL_POINTER",
//		"type": "VO_CHAR",
//		"index": 0
//	},
//	"m_paramArrayPathingCoefficients":
//	{
//		"category": "NULL_POINTER",
//		"type": "VO_CHAR",
//		"index": 0
//	}
//}
// MHasKV3TransferPolymorphicClassname
class CVMixSteamAudioPathingProcessorDesc : public CVMixBaseProcessorDesc
{
	CVMixParameterFloat m_paramPositionX;
	CVMixParameterFloat m_paramPositionY;
	CVMixParameterFloat m_paramPositionZ;
	CVMixParameterFloat m_paramPathingMixLevel;
	CVMixParameterFloat m_paramBand;
	CVMixDataOffset m_paramArrayPathingEQ;
	CVMixDataOffset m_paramArrayPathingCoefficients;
};
