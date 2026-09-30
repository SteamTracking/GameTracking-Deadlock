// MHasKV3TransferPolymorphicClassname
class CNavLinkSubMotor_Legacy : public INavLinkSubMotor
{
	CAnimGraphControllerPtr m_pGraphController;
	int32 m_nMode;
	BodySectionMutex_t m_eBodySectionMutex;
	CNavLinkSubMotor_Legacy_Transition m_transition;
	CNavLinkSubMotor_Legacy_NavLink m_navLink;
};
