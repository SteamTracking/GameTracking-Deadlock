// MGetKV3ClassDefaults = null
// MHasKV3TransferPolymorphicClassname
class CNavLinkMotor_NonZUp_Transition : public INavLinkSubMotor
{
	CountdownTimer m_transitionTimer;
	CTransformWS m_xTransitionOrigin;
	CTransformWS m_xTransitionTarget;
};
