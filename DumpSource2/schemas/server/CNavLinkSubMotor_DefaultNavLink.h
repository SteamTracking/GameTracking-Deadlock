// MGetKV3ClassDefaults = null
// MHasKV3TransferPolymorphicClassname
class CNavLinkSubMotor_DefaultNavLink : public INavLinkSubMotor
{
	bool m_bExternalGraphSet;
	int32 m_nNavLinkIndex;
	int32 m_nTickStarted;
	CHandle< CNavLinkAreaEntity > m_hNavLinkEntity;
	CNavLinkSubMotor_DefaultNavLink::State_t m_eState;
	CNavLinkSubMotor_DefaultNavLink::TargetType_t m_eTargetType;
	BodySectionMutex_t m_eBodySectionMutex;
	bool m_bIsFromMovement;
	CRelativeTransform m_source;
	CRelativeTransform m_target;
	CTransformWS m_tSourcePrevious;
	CTransformWS m_tTargetPrevious;
	CAnimGraphControllerPtr m_pGraphController;
};
