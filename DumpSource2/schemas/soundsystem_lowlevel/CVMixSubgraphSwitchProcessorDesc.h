// MGetKV3ClassDefaults = {
//	"_class": "CVMixSubgraphSwitchProcessorDesc",
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
//		"m_name": "",
//		"m_effectName": "",
//		"m_subgraphs":
//		[
//		],
//		"m_interpolationMode": "SUBGRAPH_INTERPOLATION_TEMPORAL_CROSSFADE",
//		"m_bOnlyTailsOnFadeOut": false,
//		"m_flInterpolationTime": 0.000000
//	},
//	"m_paramEffectName":
//	{
//		"m_offset":
//		{
//			"category": "NULL_POINTER",
//			"type": "VO_CHAR",
//			"index": 0
//		}
//	},
//	"m_paramSelectionIndex":
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
class CVMixSubgraphSwitchProcessorDesc : public CVMixBaseProcessorDesc
{
	VMixSubgraphSwitchDesc_t m_desc;
	CVMixParameterEffectName m_paramEffectName;
	CVMixParameterFloat m_paramSelectionIndex;
};
