// MHasKV3TransferPolymorphicClassname
class CNavLinkSubMotor_DefaultNavLink_GraphController : public CAnimGraphControllerBase
{
	CAnimGraph2ParamRef< CTransform > m_tNavLinkTarget;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_sNavLinkEntryType;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_sNavLinkExitType;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_sNavLinkState;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_sNavLinkEntryGait;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_sNavLinkExitGait;
	CAnimGraph2ParamOptionalRef< Vector > m_vNavLinkExitDirection;
};
