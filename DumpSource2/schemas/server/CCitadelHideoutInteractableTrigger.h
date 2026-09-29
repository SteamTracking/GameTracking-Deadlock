class CCitadelHideoutInteractableTrigger : public CBaseTrigger, public IHideoutInteractable
{
	CEntityIOOutput m_OnInteracted;
	CUtlString m_strInteractLocString;
	EHideoutButtonAction m_eHideoutAction;
};
