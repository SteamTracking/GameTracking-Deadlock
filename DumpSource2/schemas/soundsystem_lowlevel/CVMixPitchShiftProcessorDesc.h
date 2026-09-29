// MGetKV3ClassDefaults = {
//	"_class": "CVMixPitchShiftProcessorDesc",
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
//		"m_nGrainSampleCount": 0,
//		"m_flPitchShift": 0.000000,
//		"m_nQuality": 0,
//		"m_nProcType": 0
//	},
//	"m_paramPitchScale":
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
class CVMixPitchShiftProcessorDesc : public CVMixBaseProcessorDesc
{
	VMixPitchShiftDesc_t m_desc;
	CVMixParameterFloat m_paramPitchScale;
};
