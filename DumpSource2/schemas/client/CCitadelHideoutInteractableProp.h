class CCitadelHideoutInteractableProp : public C_DynamicProp, public IHideoutInteractable
{
	CEntityIOOutput m_OnStartTouch;
	CEntityIOOutput m_OnStartTouchAll;
	CEntityIOOutput m_OnEndTouch;
	CEntityIOOutput m_OnEndTouchAll;
	CEntityIOOutput m_OnInteracted;
	CUtlString m_strInteractLocString;
	EHideoutButtonInteractStyle m_eInteractStyle;
	EHideoutButtonAction m_eHideoutAction;
	float32 m_flInteractDistance;
	CUtlString m_strWorldPanelEntity;
	CUtlString m_strOpacityCurveString;
};
