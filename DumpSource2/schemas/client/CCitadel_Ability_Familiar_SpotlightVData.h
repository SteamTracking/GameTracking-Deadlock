// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Familiar_SpotlightVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ExposedAuraModifier;
	CEmbeddedSubclass< CCitadel_Modifier_Base_Buildup > m_BuildupModifier;
	CEmbeddedSubclass< CCitadelModifier > m_EffectModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_EyeGlowParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strChannelFinishSound;
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
	// MPropertyStartGroup = "SAT Volume"
	Color aimColorDesat; // = [ 150, 207, 184 ]
	Color aimColorSat; // = [ 255, 255, 255 ]
	Color aimColorOutline; // = [ 150, 207, 184 ]
	float32 m_flSatVolumeInnerConeSize; // = 0.5
};
