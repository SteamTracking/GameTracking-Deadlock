// MGetKV3ClassDefaults = {
//	"_class": "CVMixFreeverbProcessorDesc",
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
//		"m_flRoomSize": 0.000000,
//		"m_flDamp": 0.000000,
//		"m_flWidth": 0.000000,
//		"m_flLateReflections": 0.000000
//	}
//}
// MHasKV3TransferPolymorphicClassname
class CVMixFreeverbProcessorDesc : public CVMixBaseProcessorDesc
{
	VMixFreeverbDesc_t m_desc;
};
