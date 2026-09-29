// MGetKV3ClassDefaults = {
//	"_class": "CVMixDynamicsCompressorProcessorDesc",
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
//		"m_fldbOutputGain": 0.000000,
//		"m_fldbCompressionThreshold": -6.000000,
//		"m_fldbKneeWidth": 0.000000,
//		"m_flCompressionRatio": 2.000000,
//		"m_flAttackTimeMS": 100.000000,
//		"m_flReleaseTimeMS": 400.000000,
//		"m_flRMSTimeMS": 300.000000,
//		"m_flWetMix": 1.000000,
//		"m_flSCHighPassFreq": 0.000000,
//		"m_bPeakMode": false,
//		"m_bAutoMakeupGain": false
//	},
//	"m_outParamLevel":
//	{
//		"m_offset":
//		{
//			"category": "NULL_POINTER",
//			"type": "VO_CHAR",
//			"index": 0
//		}
//	},
//	"m_outParamdBLevel":
//	{
//		"m_offset":
//		{
//			"category": "NULL_POINTER",
//			"type": "VO_CHAR",
//			"index": 0
//		}
//	},
//	"m_outParamReduction":
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
class CVMixDynamicsCompressorProcessorDesc : public CVMixBaseProcessorDesc
{
	VMixDynamicsCompressorDesc_t m_desc;
	CVMixParameterFloat m_outParamLevel;
	CVMixParameterFloat m_outParamdBLevel;
	CVMixParameterFloat m_outParamReduction;
};
