// MGetKV3ClassDefaults = {
//	"m_Center":
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
//	"m_flRadius": 0.000000,
//	"m_flRelArc": 0.000000,
//	"m_flMinAllowedRadius": 0.000000,
//	"m_nFlags": "",
//	"m_vUp":
//	[
//		340282346638528859811704183484516925440.000000,
//		340282346638528859811704183484516925440.000000,
//		340282346638528859811704183484516925440.000000
//	]
//}
class AI_PathfindingData_RadialGoal_t
{
	CRelativeLocation m_Center;
	float32 m_flRadius;
	float32 m_flRelArc;
	float32 m_flMinAllowedRadius;
	RadialGoalFlags_t m_nFlags;
	Vector m_vUp;
};
