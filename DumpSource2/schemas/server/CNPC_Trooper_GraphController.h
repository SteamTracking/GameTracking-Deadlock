// MGetKV3ClassDefaults = {
//	"_class": "CNPC_Trooper_GraphController",
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
//	"m_eTurn": null,
//	"m_eBaseAction": null,
//	"m_eTrooperAction": null,
//	"m_ePivot": null,
//	"m_flAimPitch": null,
//	"m_flAimYaw": null,
//	"m_flRunSpeed": null,
//	"m_bAttack": null,
//	"m_bInAirForced": null,
//	"m_bJumped": null,
//	"m_bLanded": null
//}
// MHasKV3TransferPolymorphicClassname
class CNPC_Trooper_GraphController : public CAI_CitadelNPC_GraphController
{
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_eBaseAction;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_eTrooperAction;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_ePivot;
	CAnimGraph2ParamOptionalRef< float32 > m_flAimPitch;
	CAnimGraph2ParamOptionalRef< float32 > m_flAimYaw;
	CAnimGraph2ParamOptionalRef< float32 > m_flRunSpeed;
	CAnimGraph2ParamOptionalRef< bool > m_bAttack;
	CAnimGraph2ParamOptionalRef< bool > m_bInAirForced;
	CAnimGraph2ParamOptionalRef< bool > m_bJumped;
	CAnimGraph2ParamOptionalRef< bool > m_bLanded;
};
