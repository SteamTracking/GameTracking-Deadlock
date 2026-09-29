class CCitadelHideoutInteractableTrigger : public C_BaseTrigger, public IHideoutInteractable
{
	CEntityIOOutput m_OnInteracted;
	CUtlString m_strInteractLocString;
	EHideoutButtonAction m_eHideoutAction;
};
