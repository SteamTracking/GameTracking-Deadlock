// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Nano_ShadowVData : public CitadelAbilityVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ShadowModifier;
	CEmbeddedSubclass< CCitadelModifier > m_PurgeModifier;
	CEmbeddedSubclass< CCitadelModifier > m_EnemyAura;
	// MPropertyGroupName = "GamePlay"
	float32 m_flAuraRadius; // = 2000
};
