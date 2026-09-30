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
