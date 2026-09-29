// MGetKV3ClassDefaults = {
//	"m_hHandle": 18446744073709551615,
//	"m_hOwner": null,
//	"m_nTypeMask": "",
//	"m_nFlags": "",
//	"m_nPrimaryType": "eInvalid",
//	"m_nChannel": "eUnspecified",
//	"m_nCategory": "",
//	"m_flRadius": 0.000000,
//	"m_flExpireTime": null,
//	"m_vOrigin":
//	{
//		"m_Type": "WORLD_SPACE_POSITION",
//		"m_vRelativeOffset":
//		[
//			340282346638528859811704183484516925440.000000,
//			340282346638528859811704183484516925440.000000,
//			340282346638528859811704183484516925440.000000
//		],
//		"m_vWorldSpacePos": null,
//		"m_hEntity": null,
//		"m_nLastKnownNavAreaVersion": 0,
//		"m_nNavAreaID": 4294967295,
//		"m_nNavBlockID": 4294967295
//	},
//	"m_hTarget": null
//}
class CAI_VolumetricEvent
{
	AI_VolumetricEventHandle_t m_hHandle;
	CHandle< CBaseEntity > m_hOwner;
	AI_VolumetricEventTypeMask_t m_nTypeMask;
	AI_VolumetricEventFlags_t m_nFlags;
	AI_VolumetricEventType_t m_nPrimaryType;
	AI_VolumetricEventChannel_t m_nChannel;
	AI_VolumetricEventCategory_t m_nCategory;
	float32 m_flRadius;
	GameTime_t m_flExpireTime;
	CRelativeLocation m_vOrigin;
	CHandle< CBaseEntity > m_hTarget;
};
