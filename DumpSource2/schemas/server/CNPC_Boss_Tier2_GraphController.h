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
