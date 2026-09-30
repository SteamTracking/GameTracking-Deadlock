// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_UltComboVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_MeleeSwingParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_MeleeImpactParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SelfModifier;
	CEmbeddedSubclass< CCitadel_Modifier_UltCombo_Target > m_TargetModifier;
	CEmbeddedSubclass< CCitadelModifier > m_KillCheckModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flKillCheckWindow; // = 3
	float32 m_flDamageInterval; // = 0.2
};
