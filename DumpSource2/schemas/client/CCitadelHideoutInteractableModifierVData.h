// MHasKV3TransferPolymorphicClassname
class CCitadelHideoutInteractableModifierVData : public CCitadelModifierVData
{
	CUtlString m_strInteractLocString;
	EHideoutButtonInteractStyle m_nInteractStyle; // = "k_eHideoutUse"
	float32 m_flInteractDistance;
	float32 m_flInteractLookRadius;
	CEmbeddedSubclass< CCitadelModifier > m_InteractModifier;
};
