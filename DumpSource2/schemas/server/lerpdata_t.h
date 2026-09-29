// MGetKV3ClassDefaults = {
//	"m_hEnt": null,
//	"m_MoveType": "MOVETYPE_NONE",
//	"m_flStartTime": null,
//	"m_vecStartOrigin": null,
//	"m_qStartRot":
//	[
//		0.000000,
//		0.000000,
//		0.000000,
//		1.000000
//	],
//	"m_nFXIndex": -1
//}
class lerpdata_t
{
	CHandle< CBaseEntity > m_hEnt;
	MoveType_t m_MoveType;
	GameTime_t m_flStartTime;
	VectorWS m_vecStartOrigin;
	Quaternion m_qStartRot;
	ParticleIndex_t m_nFXIndex;
};
