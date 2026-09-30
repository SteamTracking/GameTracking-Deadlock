// MHasKV3TransferPolymorphicClassname
class CNavLinkSubMotor_Legacy_NavLink : public CNavLinkSubMotor_Legacy_Transition
{
	CAnimGraphControllerPtr m_pExternalGraphController;
	CHandle< CNavLinkAreaEntity > m_hNavLinkEntity;
	int32 m_nNavLinkIndex;
	bool m_bExternalGraphSet;
};
