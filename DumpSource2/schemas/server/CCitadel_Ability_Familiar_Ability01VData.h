// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Familiar_Ability01VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_EffectModifier;
	CEmbeddedSubclass< CCitadelModifier > m_StaringModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	CEmbeddedSubclass< CCitadelModifier > m_UnstoppableWhileChannelingModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_AirSpeedMax;
	float32 m_FallSpeedMax;
	float32 m_VerticalDrag;
	float32 m_AirDrag;
	float32 m_CameraTurnRateMax;
	float32 m_flShotCosmeticVarianceMagnitude;
	float32 m_JumpCeilingCheckDistance;
	float32 m_JumpSpeed;
	float32 m_JumpPitch;
	float32 m_JumpUpDownSpeed;
	float32 m_ConeSpacingMeters;
	CPiecewiseCurve m_RadiusGrowthCurve;
	// MPropertyStartGroup = "SAT Volume"
	Color aimColorDesat; // = [ 150, 207, 184 ]
	Color aimColorSat; // = [ 255, 255, 255 ]
	Color aimColorOutline; // = [ 150, 207, 184 ]
	float32 m_flSatVolumeInnerConeSize; // = 0.5
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BeamParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_EyeGlowParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TargetDebuffParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_GroundParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_RadiusIndicatorParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_RadiusIndicatorClientParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplosionParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_WakeUpDamageParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_SleepHitSound;
};
