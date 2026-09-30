// MHasKV3TransferPolymorphicClassname
class CAbilityImmobilizeTrapVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PreviewRingParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TrapHighlightParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ArmedParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strTripSound;
	CSoundEventName m_strExplodeSound;
	CSoundEventName m_strExpiredSound;
	CSoundEventName m_strImmobilizeTargetSound;
	CSoundEventName m_strArmingSound;
	CSoundEventName m_strArmedSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_GlitchModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
};
