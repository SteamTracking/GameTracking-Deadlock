// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Artist_StoneTurtleVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_InitialImpactParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SplashParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_AuraModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strInitialImpactSound;
	CSoundEventName m_strSplashSound;
	CSoundEventName m_strExplodeSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flInitialVerticalOffset;
};
