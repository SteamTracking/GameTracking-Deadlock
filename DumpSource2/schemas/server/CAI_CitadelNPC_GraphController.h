// MGetKV3ClassDefaults = {
//	"_class": "CAI_CitadelNPC_GraphController",
//	"m_hExternalGraph": 4294967295,
//	"m_sCurrScheduleName": null,
//	"m_sCurrTaskName": null,
//	"m_pszNPCState": null,
//	"m_sCurrMovementName": null,
//	"m_flRandomSeed": null,
//	"m_flTimeScale": null,
//	"m_flHealthPct": null,
//	"m_bHasTarget": null,
//	"m_bInAir": null,
//	"m_eMovementBlockedID": null,
//	"m_eHitReactID": null,
//	"m_flHitReactDuration": null,
//	"m_flMoveSpeed": null,
//	"m_flForwardSpeed": null,
//	"m_flStrafeSpeed": null,
//	"m_flVerticalSpeed": null,
//	"m_flLookHeading": null,
//	"m_flLookPitch": null,
//	"m_vLookTarget": null,
//	"m_bMeleeAttack": null,
//	"m_bRangedAttack": null,
//	"m_bKill": null,
//	"m_eFlinch": null,
//	"m_eTurn": null
//}
// MHasKV3TransferPolymorphicClassname
class CAI_CitadelNPC_GraphController : public CAI_BaseNPCGraphController
{
	CAnimGraph2ParamOptionalRef< float32 > m_flRandomSeed;
	CAnimGraph2ParamOptionalRef< float32 > m_flTimeScale;
	CAnimGraph2ParamOptionalRef< float32 > m_flHealthPct;
	CAnimGraph2ParamOptionalRef< bool > m_bHasTarget;
	CAnimGraph2ParamOptionalRef< bool > m_bInAir;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_eMovementBlockedID;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_eHitReactID;
	CAnimGraph2ParamOptionalRef< float32 > m_flHitReactDuration;
	CAnimGraph2ParamOptionalRef< float32 > m_flMoveSpeed;
	CAnimGraph2ParamOptionalRef< float32 > m_flForwardSpeed;
	CAnimGraph2ParamOptionalRef< float32 > m_flStrafeSpeed;
	CAnimGraph2ParamOptionalRef< float32 > m_flVerticalSpeed;
	CAnimGraph2ParamOptionalRef< float32 > m_flLookHeading;
	CAnimGraph2ParamOptionalRef< float32 > m_flLookPitch;
	CAnimGraph2ParamOptionalRef< Vector > m_vLookTarget;
	CAnimGraph2ParamOptionalRef< bool > m_bMeleeAttack;
	CAnimGraph2ParamOptionalRef< bool > m_bRangedAttack;
	CAnimGraph2ParamOptionalRef< bool > m_bKill;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_eFlinch;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_eTurn;
};
