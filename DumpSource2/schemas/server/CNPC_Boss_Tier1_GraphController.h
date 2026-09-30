// MHasKV3TransferPolymorphicClassname
class CNPC_Boss_Tier1_GraphController : public CAI_CitadelNPC_GraphController
{
	CAnimGraphParamRef< char* > m_pszActivity;
	CAnimGraphParamRef< char* > m_pszLaneSide;
	CAnimGraphParamRef< bool > m_bShieldMode;
	CAnimGraphParamRef< CGlobalSymbol > m_Activity;
};
