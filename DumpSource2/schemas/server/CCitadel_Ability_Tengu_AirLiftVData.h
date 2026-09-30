// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Tengu_AirLiftVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_FlyingModifier;
	CEmbeddedSubclass< CCitadelModifier > m_GrabModifier;
	CEmbeddedSubclass< CCitadelModifier > m_HoldBombModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DroppedBuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ExplodingAllyModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SilenceModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BulletResistModifier;
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_InitialExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HoldBombEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_strExplodeSound;
	CSoundEventName m_strHoldBombLoopSound;
	CSoundEventName m_strBombLaunchSound;
	CSoundEventName m_strBarrierSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flAirDrag; // = 3
	float32 m_flMaxFallSpeed; // = 5
	float32 m_flTargetAirSpeedFast; // = 472
	float32 m_flTargetAirSpeedBase; // = 354
	float32 m_flSprintMult; // = 1.5
	float32 m_flAcceleration; // = 1.3
	float32 m_flDecceleration; // = 4
	float32 m_flAirSideSpeedPercent; // = -100
	float32 m_flBoostEndVerticalSpeed; // = 50
	float32 m_flBoostSpeedUp; // = 750
	float32 m_flCrouchLaunchReduction; // = 0.3
	float32 m_flMinFlyHeight; // = 200
	float32 m_flMaxFlyHeight; // = 1720
	float32 m_flMaxPitchUp; // = -60
	float32 m_flMaxPitchDown; // = 80
	float32 m_flAllyDelayedBoostTime; // = 0.3
	float32 m_flChannelingAirDrag; // = 3
	float32 m_flChannelingMaxFallSpeed; // = 5
	float32 m_flBombReleaseSpeed; // = 1200
	float32 m_flBombReleasePitch;
	float32 m_flBombDropReleaseOffset; // = -120
	float32 m_flHoldBombOffsetX; // = 60
	float32 m_flHoldBombOffsetY; // = 20
	float32 m_flHoldBombOffsetZ; // = -20
	float32 m_flAnglePitchBias; // = 15
	float32 m_flTrackAmount; // = 200
	float32 m_flMoveCollideSpeed; // = 275.591003
};
