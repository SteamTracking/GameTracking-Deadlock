// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Nano_ClusterGrenadeVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_ExplodeSound;
};
