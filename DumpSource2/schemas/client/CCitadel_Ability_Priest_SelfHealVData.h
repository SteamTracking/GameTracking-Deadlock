// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Priest_SelfHealVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SelfModifier;
};
