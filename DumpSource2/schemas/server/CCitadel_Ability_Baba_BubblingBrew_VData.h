// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Baba_BubblingBrew_VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_PullModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplosionParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_StringParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BoltParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CasterBuffParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_nStringParticle;
	float32 m_flPulseFrequency; // = 6
	float32 m_flPulseWidth; // = 0.33
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strExplodeSound;
	CSoundEventName m_strFirstExplosionSound;
	CSoundEventName m_strPullSound;
	CSoundEventName m_strVictimPulledSound;
	CSoundEventName m_strBeamPointClosestLoopSound;
	// MPropertyStartGroup = "Gameplay"
	CPiecewiseCurve m_ProjectileTurnAngleSpeedCurve;
	float32 m_flAllowedSlideAngleCos; // = -3
	// MPropertyStartGroup = "UI"
	float32 m_flStackExpiryWarningDuration; // = 3
};
