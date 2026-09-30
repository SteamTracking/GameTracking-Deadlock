// MHasKV3TransferPolymorphicClassname
class CCitadel_NPCAbility_Vanguard_AOEBuff_VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_HealingModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
};
