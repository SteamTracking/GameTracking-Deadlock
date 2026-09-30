// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_LifeDrainVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_LifeDrainTargetModifier;
	CEmbeddedSubclass< CCitadelModifier > m_LifeDrainCasterModifier;
};
