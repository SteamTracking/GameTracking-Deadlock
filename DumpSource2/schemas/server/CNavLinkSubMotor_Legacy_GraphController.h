// MHasKV3TransferPolymorphicClassname
class CNavLinkSubMotor_Legacy_GraphController : public CAnimGraphControllerBase
{
	CAnimGraphParamRef< Vector > m_vecNavLinkTarget;
	CAnimGraphParamRef< Vector > m_vecNavLinkUp;
	CAnimGraphTagOptionalRef m_sMovementTransitionForceFacingDisabled;
};
