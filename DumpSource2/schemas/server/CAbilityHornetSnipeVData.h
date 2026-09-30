// MHasKV3TransferPolymorphicClassname
class CAbilityHornetSnipeVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AssassinateShotParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AssassinateShotParticleOwnerOnly;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_LaserSightParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_LaserSightParticleOwnerOnly;
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SnipeModifier;
	CEmbeddedSubclass< CCitadelModifier > m_GlowEnemyModifier;
	CEmbeddedSubclass< CCitadelModifier > m_KillCheckModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strSnipeImpactSound;
	CSoundEventName m_strZoomIn;
	CSoundEventName m_strZoomOut;
	CSoundEventName m_strFullyChargedSound;
	CSoundEventName m_strBeamPointClosestLoopSound;
	// MPropertyStartGroup = "+Snipe Properties"
	float32 m_flMinScopeTimeToShoot; // = 0.1
	float32 m_flFadeToBlackTime; // = 0.2
	float32 m_flFoVChangeTime; // = 0.15
	CUtlVector< float32 > m_ScopeFoV;
	float32 m_flKillCheckDuration; // = 4
};
