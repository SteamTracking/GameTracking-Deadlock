// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_CatapultDamageWatcherVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_StunModifier;
	float32 m_flDamageHealthPct; // = 15
};
