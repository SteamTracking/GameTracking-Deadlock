// MGetKV3ClassDefaults = {
//	"_class": "CVMixVocoderProcessorDesc",
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
//		"m_nBandCount": 0,
//		"m_flBandwidth": 0.000000,
//		"m_fldBModGain": 0.000000,
//		"m_flFreqRangeStart": 0.000000,
//		"m_flFreqRangeEnd": 0.000000,
//		"m_fldBUnvoicedGain": 0.000000,
//		"m_flAttackTimeMS": 0.000000,
//		"m_flReleaseTimeMS": 0.000000,
//		"m_nDebugBand": 0,
//		"m_bPeakMode": false
//	},
//	"m_paramBandwidth":
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
class CVMixVocoderProcessorDesc : public CVMixBaseProcessorDesc
{
	VMixVocoderDesc_t m_desc;
	CVMixParameterFloat m_paramBandwidth;
};
