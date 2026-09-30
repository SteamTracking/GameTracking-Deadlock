// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Familiar_AttachVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_AttachedModifier;
	CEmbeddedSubclass< CCitadelModifier > m_MovingToAttachModifier;
	CEmbeddedSubclass< CCitadelModifier > m_CameraDummyModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SpeedModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DeathBarrierModifier;
	CEmbeddedSubclass< CCitadelModifier > m_HopOutLockoutModifier;
	CEmbeddedSubclass< CCitadelModifier > m_LaunchTossModifier;
	CEmbeddedSubclass< CCitadelModifier > m_LaunchedSelfModifier;
	CEmbeddedSubclass< CCitadelModifier > m_AllyLockoutModifier;
	CEmbeddedSubclass< CCitadelModifier > m_HopOffBuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_AttachHealModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_sCamDummyModelName;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_FakeFamiliarParticle;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flDetachForce;
	float32 m_flDetachForceUp;
	float32 m_flTriggeredDetachForce;
	float32 m_flTriggeredDetachForceUp;
	CPiecewiseCurve m_MovingToAttachProjectileSpeedCurve;
	CPiecewiseCurve m_LaunchAngleRemap;
};
