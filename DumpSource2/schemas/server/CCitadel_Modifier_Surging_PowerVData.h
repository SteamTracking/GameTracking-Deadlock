// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Surging_PowerVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_BerserkerSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ModifierActiveDisplay;
};
