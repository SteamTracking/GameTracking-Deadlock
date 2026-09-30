// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_ThrowSandVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SilenceDebuff;
};
