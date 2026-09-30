// MHasKV3TransferPolymorphicClassname
class CAI_MotorServices_GraphController : public CAnimGraphControllerBase
{
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_sNavLinkSelection;
	CAnimGraphParamRef< bool > m_bNavLinkIsOnPath;
	CAnimGraphParamRef< float32 > m_flPathDistanceToNavLink;
	CAnimGraphParamRef< bool > m_bIsNonZUp;
	CAnimGraphParamRef< float32 > m_flMovementTargetSpeed;
	int32 m_nNavLinkExternalGraphSlot;
	CAnimGraphTagOptionalRef m_sAllowMovementOffPath;
	CAnimGraphTagOptionalRef m_sAllowMovementOffNavMesh;
	CAnimGraphTagOptionalRef m_sRestrictMovementToNavMeshDuringCustomMove;
};
