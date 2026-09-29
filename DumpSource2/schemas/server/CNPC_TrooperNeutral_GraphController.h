// MGetKV3ClassDefaults = {
//	"_class": "CNPC_TrooperNeutral_GraphController",
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
//	"m_bShielded": null,
//	"m_bAlert": null,
//	"m_pszAttackLeanPosition": null,
//	"m_eBaseAction": null,
//	"m_MoveType": null,
//	"m_eNeutralTurn": null
//}
// MHasKV3TransferPolymorphicClassname
class CNPC_TrooperNeutral_GraphController : public CAI_CitadelNPC_GraphController
{
	CAnimGraphParamRef< bool > m_bShielded;
	CAnimGraphParamRef< bool > m_bAlert;
	CAnimGraphParamRef< char* > m_pszAttackLeanPosition;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_eBaseAction;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_MoveType;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_eNeutralTurn;
};
