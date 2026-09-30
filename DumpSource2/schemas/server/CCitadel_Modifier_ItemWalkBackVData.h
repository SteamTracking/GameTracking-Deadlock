// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_ItemWalkBackVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_IdleParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_RunningParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BiasEffectPositive;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BiasEffectNegative;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_WalkingLoopSound;
	CSoundEventName m_IdlingLoopSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flStopDistance; // = 600
	float32 m_flMoveSpeed; // = 250
	float32 m_flVerticalOffset; // = 16
	float32 m_flTolerance; // = 20
	float32 m_flRepathTime; // = 5
	float32 m_flWaitTimeLimit; // = 20
	float32 m_flWaitTimeLimitOverheld;
	float32 m_flCheckPlayerRate; // = 0.5
};
