// MGetKV3ClassDefaults = {
//	"m_sName": "",
//	"m_vInitialPosition":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_flRadius": 0.000000,
//	"m_flRoll": 0.000000,
//	"m_bOverrideGaitInCombat": false,
//	"m_eMinMovementGait": "eInvalid",
//	"m_eMaxMovementGait": "eInvalid",
//	"m_vWorldPosition": null,
//	"m_vForward":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_vLeft":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_flDistToNext": 0.000000
//}
class PathAccompanyNode_t
{
	CUtlString m_sName;
	Vector m_vInitialPosition;
	float32 m_flRadius;
	float32 m_flRoll;
	bool m_bOverrideGaitInCombat;
	SharedMovementGait_t m_eMinMovementGait;
	SharedMovementGait_t m_eMaxMovementGait;
	VectorWS m_vWorldPosition;
	Vector m_vForward;
	Vector m_vLeft;
	float32 m_flDistToNext;
};
