// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_DeadpackRocketeerVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_JetpackingModifier;
	CEmbeddedSubclass< CCitadelModifier > m_JetpackingVTOLModifier;
	CEmbeddedSubclass< CCitadelModifier > m_MaxHeatModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BounceBackModifier;
	// MPropertyStartGroup = "Jetpacking Intent"
	CPiecewiseCurve m_IntentSpaceFwdVelocity;
	CPiecewiseCurve m_IntentSpaceLeftVelocity;
	CPiecewiseCurve m_IntentSpaceVerticalVelocity;
	CPiecewiseCurve m_IntentSpaceScaleWhileHolding;
	float32 m_flIntentSpaceStringStrengthFwd;
	float32 m_flIntentSpaceStringStrengthLeft;
	float32 m_flIntentSpaceStringStrengthVertical;
	float32 m_flIntentSpaceSurplusSpringStrength; // = 3.5
	float32 m_flIntentSpaceVerticalWithXYInput;
	float32 m_flIntentSpaceVerticalZInputOnly;
	float32 m_flVerticalIntentDiminishRangeBegin; // = 1300
	float32 m_flVerticalIntentDiminishRangeEnd; // = 1450
	float32 m_flVerticalIntentDiminishFracAtRangeEnd; // = 0.1
	// MPropertyStartGroup = "Jetpacking Slows"
	float32 m_flSlowEffectivenessLateral; // = 1
	float32 m_flSlowEffectivenessVertical; // = 1
	// MPropertyStartGroup = "Movement"
	float32 m_flAirDrag;
	float32 m_flAirDashDistancePct;
	float32 m_flAirSpeed;
	float32 m_flDashJumpJetpackLockoutDuration;
	float32 m_flJumpHeightIncreasePercent; // = 10
	// MPropertyStartGroup = "Cold Hits"
	float32 m_flColdHitHeatRemovedPercent; // = 10
	// MPropertyStartGroup = "Overheat Sputter"
	float32 m_flSputterChance;
	float32 m_flSputterDuration;
	float32 m_flSputterImmuneDuration;
	// MPropertyStartGroup = "Gravity Reduction"
	CPiecewiseCurve m_FallSpeedReductionCurve;
	float32 m_flGravityReductionDuration_AirDash;
	float32 m_flGravityReductionDuration_Shoot;
	float32 m_flGravityReductionDuration_Ability;
	float32 m_flGravityReductionDuration_JetpackInput;
	// MPropertyStartGroup = "VTOL"
	CPiecewiseCurve m_ImpulseAccelCurve;
	float32 m_flPlayerCollisionSphereSize; // = 100
	float32 m_flPlayerCollisionLookaheadFrames; // = 1
	float32 m_flTrackAmount; // = 330
	float32 m_flMinAimAngle; // = 60
	// MPropertyStartGroup = "Thrust Movement"
	float32 m_flFromGroundThrustAddZ; // = 1000
	float32 m_flFromGroundThrustXYMultiplier; // = 1.5
	float32 m_flFromGroundThrustFwd; // = 200
	float32 m_flFromGroundNoThrustAddZ; // = 100
	float32 m_flInSlideThrustMultiplier; // = 0.7
	float32 m_flTimeOnGroundBeforeLaunchAllowed; // = 0.3
	// MPropertyStartGroup = "Bounce Back"
	float32 m_flBounceBackZSpeed; // = 1000
	float32 m_flBounceBackXYSpeedLimit; // = 1000
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strMaxHeatLoopingSound;
	CSoundEventName m_strLaunchGroundSound;
	CSoundEventName m_strLaunchAirSound;
	CSoundEventName m_strRocketeerLoopingSound;
	CSoundEventName m_strRocketeerLoopStopSound;
	CSoundEventName m_strRocketeerOverheatedLoopingSound;
	CSoundEventName m_strRocketeerAirDashJumpSound;
	CSoundEventName m_strHeatWarningSound;
	CSoundEventName m_strMaxHeatSound;
	CSoundEventName m_strChimeraDiveSound;
	float32 m_flHeatWarningFraction;
	CSoundEventName m_strLaunchInCooldownSound;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DeathExplosionWarningFX;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplosionFX;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_VTOLImpactOnGroundFX;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_VTOLTargetingPreviewFX;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AmbientParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_LaunchInCooldownParticle;
};
