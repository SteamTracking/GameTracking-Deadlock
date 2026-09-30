// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Frank_ShockTarget2VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_ShockShootSound;
	CSoundEventName m_ShockImpactSound;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ShockImpactParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TracerParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ShockReadyParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	CEmbeddedSubclass< CCitadelModifier > m_FullyChargedFXModifier;
};
