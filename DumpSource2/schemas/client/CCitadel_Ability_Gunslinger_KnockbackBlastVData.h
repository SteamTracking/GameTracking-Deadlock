// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Gunslinger_KnockbackBlastVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ImpactParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_WallImpactParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strWallSlamSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
};
