// MHasKV3TransferPolymorphicClassname
class CCitadel_Neutral_Hideout_Cat_GraphController : public CAnimGraphControllerBase
{
	CAnimGraph2ParamRef< float32 > m_flForwardSpeed;
	CAnimGraph2ParamRef< float32 > m_flLookHeading;
	CAnimGraph2ParamRef< float32 > m_flLookPitch;
	CAnimGraph2ParamRef< float32 > m_flMoveSpeed;
	CAnimGraph2ParamRef< CGlobalSymbol > m_MoveType;
	CAnimGraph2ParamRef< CGlobalSymbol > m_BaseAction;
	CAnimGraph2ParamOptionalRef< float32 > m_flRandomSeed;
};
