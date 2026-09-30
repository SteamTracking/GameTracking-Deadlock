// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Operative_Blindside_VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_EnemyDebuffModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_ExplosionSound;
};
