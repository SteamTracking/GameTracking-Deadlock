// MGetKV3ClassDefaults = {
//	"m_location":
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
//	"m_flExpireTime": null,
//	"m_vecTargetLocationWhenUnreachable": null
//}
class UnreachableTarget_t
{
	CRelativeLocation m_location;
	GameTime_t m_flExpireTime;
	VectorWS m_vecTargetLocationWhenUnreachable;
};
