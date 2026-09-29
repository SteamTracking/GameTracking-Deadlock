// MGetKV3ClassDefaults = {
//	"_class": "CNPC_Boss_Tier2_GraphController",
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
//	"m_pszActivity": null,
//	"m_pszStompAttack": null,
//	"m_pszStaggerDirection": null,
//	"m_pszElectricBeamPosition": null,
//	"m_bStunEnding": null,
//	"b_Death": null,
//	"b_InCombat": null,
//	"fl_lookHeading": null,
//	"fl_LookPitch": null,
//	"b_AbilityLongRange": null,
//	"b_AbilitySpecial": null,
//	"b_Melee": null,
//	"b_Stagger": null,
//	"fl_LeftHeadLookHeading": null,
//	"fl_LeftHeadLookPitch": null,
//	"fl_MidHeadLookHeading": null,
//	"fl_MidHeadLookPitch": null,
//	"fl_RightHeadLookHeading": null,
//	"fl_RightHeadLookPitch": null,
//	"m_BossActionSource": null,
//	"m_BossAction": null,
//	"m_BossActivity": null
//}
// MHasKV3TransferPolymorphicClassname
class CNPC_Boss_Tier2_GraphController : public CAI_CitadelNPC_GraphController
{
	CAnimGraphParamRef< char* > m_pszActivity;
	CAnimGraphParamRef< char* > m_pszStompAttack;
	CAnimGraphParamRef< char* > m_pszStaggerDirection;
	CAnimGraphParamRef< char* > m_pszElectricBeamPosition;
	CAnimGraphParamRef< bool > m_bStunEnding;
	CAnimGraph2ParamOptionalRef< bool > b_Death;
	CAnimGraph2ParamOptionalRef< bool > b_InCombat;
	CAnimGraph2ParamOptionalRef< float32 > fl_lookHeading;
	CAnimGraph2ParamOptionalRef< float32 > fl_LookPitch;
	CAnimGraph2ParamOptionalRef< bool > b_AbilityLongRange;
	CAnimGraph2ParamOptionalRef< bool > b_AbilitySpecial;
	CAnimGraph2ParamOptionalRef< bool > b_Melee;
	CAnimGraph2ParamOptionalRef< bool > b_Stagger;
	CAnimGraph2ParamOptionalRef< float32 > fl_LeftHeadLookHeading;
	CAnimGraph2ParamOptionalRef< float32 > fl_LeftHeadLookPitch;
	CAnimGraph2ParamOptionalRef< float32 > fl_MidHeadLookHeading;
	CAnimGraph2ParamOptionalRef< float32 > fl_MidHeadLookPitch;
	CAnimGraph2ParamOptionalRef< float32 > fl_RightHeadLookHeading;
	CAnimGraph2ParamOptionalRef< float32 > fl_RightHeadLookPitch;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_BossActionSource;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_BossAction;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_BossActivity;
};
