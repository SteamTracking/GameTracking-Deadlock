// MHasKV3TransferPolymorphicClassname
class CCitadel_Werewolf_HuntVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SelfBuffWerewolfModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SelfBuffHumanModifier;
	CEmbeddedSubclass< CCitadelModifier > m_AuraWerewolfModifier;
	CEmbeddedSubclass< CCitadelModifier > m_AuraHumanModifier;
};
