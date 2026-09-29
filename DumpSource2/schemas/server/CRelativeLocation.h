// MGetKV3ClassDefaults = {
//	"m_Type": "WORLD_SPACE_POSITION",
//	"m_vRelativeOffset":
//	[
//		340282346638528859811704183484516925440.000000,
//		340282346638528859811704183484516925440.000000,
//		340282346638528859811704183484516925440.000000
//	],
//	"m_vWorldSpacePos": null,
//	"m_hEntity": null,
//	"m_nLastKnownNavAreaVersion": 0,
//	"m_nNavAreaID": 4294967295,
//	"m_nNavBlockID": 4294967295
//}
class CRelativeLocation
{
	RelativeLocationType_t m_Type;
	Vector m_vRelativeOffset;
	VectorWS m_vWorldSpacePos;
	CHandle< CBaseEntity > m_hEntity;
	uint32 m_nLastKnownNavAreaVersion;
	uint32 m_nNavAreaID;
	uint32 m_nNavBlockID;
};
