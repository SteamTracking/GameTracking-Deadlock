// MHasKV3TransferPolymorphicClassname
class CAbilityWreckingBallVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SummonParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SummonReadyParticle;
	CUtlString m_SummonParticleAttachment;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_AutoThrowModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_HoldingBallLoop;
};
