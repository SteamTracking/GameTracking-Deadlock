// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Artist_RollingProjectileVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "+Gameplay"
	bool m_bShouldDamageOnPassthrough;
	bool m_bShouldExplodeCameraForward;
	bool m_bAllowCameraSteering;
	bool m_bAttachProjectileWhileCharging;
	float32 m_flAttachForwardDistance; // = 10
	float32 m_flTraceRadius; // = 10
	float32 m_flDistanceAboveGround; // = 16
	float32 m_flFloatDownRate; // = 10
	float32 m_flClimbHeight; // = 64
	float32 m_flStepDownHeight; // = 64
	float32 m_flSlideDotThreshold; // = 1
	float32 m_flMinPitch; // = -90
	float32 m_flMaxPitch; // = 90
	float32 m_flJumpHeight; // = 10
	float32 m_flTurnRate; // = 10
	float32 m_flTurnMultiplier; // = 1
	float32 m_flSinRate; // = 1
	float32 m_flSinScale; // = 1
	float32 m_flAccelerationSpeed; // = 50
	float32 m_flBonusProjectileBackOffset; // = 50
	float32 m_flBonusProjectileLeftOffset; // = 50
	CPiecewiseCurve m_SteeringSpeedCurve;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_GroundAuraModifier;
	CEmbeddedSubclass< CBaseModifier > m_SlowModifier;
	CEmbeddedSubclass< CBaseModifier > m_DebuffModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ConeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ImpactParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ProjectileHelperParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strExplode;
};
