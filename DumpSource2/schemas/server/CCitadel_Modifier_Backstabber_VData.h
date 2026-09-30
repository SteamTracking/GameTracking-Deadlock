// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Backstabber_VData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_GlowModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_strDamageTickSound;
};
