// MGetKV3ClassDefaults = {
//	"_class": "CVMixEnvelopeProcessorDesc",
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
//		"m_flAttackTimeMS": 0.000000,
//		"m_flHoldTimeMS": 0.000000,
//		"m_flReleaseTimeMS": 0.000000
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
//	}
//}
// MHasKV3TransferPolymorphicClassname
class CVMixEnvelopeProcessorDesc : public CVMixBaseProcessorDesc
{
	VMixEnvelopeDesc_t m_desc;
	CVMixParameterFloat m_outParamLevel;
	CVMixParameterFloat m_outParamdBLevel;
};
