// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Werewolf_TransformationWatcherVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_WerewolfModifier;
	CEmbeddedSubclass< CCitadelModifier > m_HunterModifier;
	// MPropertyStartGroup = "Gameplay"
	CUtlVector< EAbilitySlots_t > m_vecWerewolfAbilitySlots;
	CUtlVector< EAbilitySlots_t > m_vecHunterAbilitySlots;
};
