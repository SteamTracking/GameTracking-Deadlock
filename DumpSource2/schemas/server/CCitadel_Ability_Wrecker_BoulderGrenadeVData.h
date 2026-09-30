// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Wrecker_BoulderGrenadeVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SummonParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SummonReadyParticle;
	CUtlString m_SummonParticleAttachment;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_ExplodeSound;
};
