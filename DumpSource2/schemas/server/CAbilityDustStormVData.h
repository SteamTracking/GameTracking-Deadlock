// MHasKV3TransferPolymorphicClassname
class CAbilityDustStormVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DustStormAura;
	CEmbeddedSubclass< CCitadelModifier > m_GrenadeTrailModifier;
};
