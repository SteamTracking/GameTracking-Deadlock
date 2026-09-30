// MHasKV3TransferPolymorphicClassname
class CFacingServices_GraphController : public CAnimGraphControllerBase
{
	CAnimGraphParamRef< float32 > m_flFacingHeading;
	CAnimGraphParamRef< Vector > m_vFacingTarget;
	CAnimGraphParamRef< CGlobalSymbol > m_sMovementStrafingState;
	CAnimGraphParamRef< CGlobalSymbol > m_sFacingReason;
	CAnimGraphTagOptionalRef m_sFacingModeUsePath;
};
