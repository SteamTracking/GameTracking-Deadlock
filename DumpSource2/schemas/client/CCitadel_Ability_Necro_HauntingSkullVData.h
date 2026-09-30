// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Necro_HauntingSkullVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_JarExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SkullFriendlyFoundParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SkullTargetFoundParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SkullTargetDashParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SkullHitParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SkullExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ResourceGainedParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HeroResourceGainedParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_SkullModel;
	float32 m_flSkullScale; // = 1
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_ResourceGainedSound;
	CSoundEventName m_HeroResourceGainedSound;
	CSoundEventName m_JarExplodeSound;
	CSoundEventName m_SkullHitSound;
	CSoundEventName m_SkullKilledSound;
	CSoundEventName m_SkullAttackSound;
	CSoundEventName m_SkullLoopStartSound;
	CSoundEventName m_SkullLoopEndSound;
	CSoundEventName m_SkullLoopSound;
	CSoundEventName m_SkullLastHitSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_AreaModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SummonModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SummonBuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_StackingDebuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flSkullRadius; // = 30
	bool m_bAllowStackingDamageFromGun; // = true
	float32 m_flInitialVelocityVariance; // = 1
	float32 m_flDrag; // = 0.1
	float32 m_flCurlNoiseStrength; // = 1
	float32 m_flCurlNoiseStrengthDuringTarget; // = 1
	float32 m_flCurlNoiseStrengthDuringFriendly; // = 1
	float32 m_flCurlNoiseMinFrequency; // = 0.1
	float32 m_flCurlNoiseMaxFrequency; // = 1
	float32 m_flBobbingFrequency; // = 10
	float32 m_flBobbingStrength; // = 10
	float32 m_flFloorSpringLength; // = 100
	float32 m_flFloorSpringStrength; // = 10
	CPiecewiseCurve m_flTargetForwardSpeed;
	float32 m_flTargetHitRecoilRatio; // = 0.5
	float32 m_flTargetHitRecoilRandomness; // = 0.5
	float32 m_flTargetHitUpVelocity; // = 10
	float32 m_flFriendlyChaseAcceleration;
	float32 m_flEnemyChaseAcceleration;
	float32 m_flFriendlyChaseMaxSpeed; // = 100
	float32 m_flEnemyChaseMaxSpeed; // = 100
	float32 m_flFriendlyChaseMinDistance; // = 100
	float32 m_flFriendlyChaseMaxDistance; // = 500
	float32 m_flFriendlyChaseRandomPositionDistance; // = 50
	float32 m_flFriendlyChaseBufferDelay; // = 1
	float32 m_flPriorityTargetLingerDuration; // = 0.3
	float32 m_flSkullMeleeRange; // = 150
};
