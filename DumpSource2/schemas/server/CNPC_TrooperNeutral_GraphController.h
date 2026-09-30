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
