// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Shakedown_TargetVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_RootModifier;
	CEmbeddedSubclass< CCitadelModifier > m_PulseModifier;
};
