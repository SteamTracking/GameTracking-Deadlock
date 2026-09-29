// MGetKV3ClassDefaults = {
//	"_class": "CVMixAutoFilterProcessorDesc",
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
//		"m_flEnvelopeAmount": 0.000000,
//		"m_flAttackTimeMS": 5.000000,
//		"m_flReleaseTimeMS": 200.000000,
//		"m_filter":
//		{
//			"m_fldbGain": 0.000000,
//			"m_flCutoffFreq": 1000.000000,
//			"m_flQ": 0.707107,
//			"m_nFilterType": "FILTER_UNKNOWN",
//			"m_nFilterSlope": "FILTER_SLOPE_12dB",
//			"m_bEnabled": true
//		},
//		"m_flLFOAmount": 0.000000,
//		"m_flLFORate": 0.000000,
//		"m_flPhase": 0.000000,
//		"m_nLFOShape": "LFO_SHAPE_SINE"
//	}
//}
// MHasKV3TransferPolymorphicClassname
class CVMixAutoFilterProcessorDesc : public CVMixBaseProcessorDesc
{
	VMixAutoFilterDesc_t m_desc;
};
