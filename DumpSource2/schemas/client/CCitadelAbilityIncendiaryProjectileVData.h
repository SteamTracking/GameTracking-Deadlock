// MHasKV3TransferPolymorphicClassname
class CCitadelAbilityIncendiaryProjectileVData : public CitadelAbilityVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
};
