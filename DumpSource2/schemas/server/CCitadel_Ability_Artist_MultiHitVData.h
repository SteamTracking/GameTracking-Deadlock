// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Artist_MultiHitVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ActiveModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_GroundAuraModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_ExplodeSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flRandomVarianceInDirection;
};
