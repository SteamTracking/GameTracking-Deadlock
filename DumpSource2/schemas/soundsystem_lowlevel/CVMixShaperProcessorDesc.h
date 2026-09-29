// MGetKV3ClassDefaults = {
//	"_class": "CVMixShaperProcessorDesc",
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
//		"m_nShape": 0,
//		"m_fldbDrive": 0.000000,
//		"m_fldbOutputGain": 0.000000,
//		"m_flWetMix": 1.000000,
//		"m_nOversampleFactor": 1
//	},
//	"m_paramDrive":
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
class CVMixShaperProcessorDesc : public CVMixBaseProcessorDesc
{
	VMixShaperDesc_t m_desc;
	CVMixParameterFloat m_paramDrive;
};
