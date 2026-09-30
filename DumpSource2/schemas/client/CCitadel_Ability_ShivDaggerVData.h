// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_ShivDaggerVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DamageDebuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SlowDebuffModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DaggerStuckParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DaggerImpactParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DaggerExplodeParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strDaggerHitSound;
	CSoundEventName m_strDaggerExplodeSound;
};
