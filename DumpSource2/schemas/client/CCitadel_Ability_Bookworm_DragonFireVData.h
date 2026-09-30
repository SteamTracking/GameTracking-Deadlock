// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Bookworm_DragonFireVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DragonSpawnParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DragonCastParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ImpactParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_ProjectileModel;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_GroundAuraModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strExpiredSound;
	// MPropertyStartGroup = "Gameplay"
	float32 flSpawnVerticalOffset;
	// MPropertyDescription = "The distance that the dragon appears away from surfaces"
	float32 flIdealSpringLength; // = 100
	// MPropertyDescription = "How strong the spring effect is. Higher values will bounce around more as it tries to reach its ideal position."
	float32 flSpringConstant; // = 10
	// MPropertyDescription = "How strong the damper effect is. Higher values will smooth out the approach and prevent overshooting."
	float32 flDamperConstant; // = 0.1
	// MPropertyDescription = "How much the dragon will look in the direction its traveling. Higher values will mean the velocity controls more of the orientation."
	float32 flVelocityImpactOnAngle; // = 0.1
	// MPropertyDescription = "How many degrees to offset our final pitch. Can be used to aim the dragon downwards."
	float32 flPitchOffset; // = 30
	// MPropertyDescription = "Changes which way is forward for the dragon based on the surface it hits. Otherwise, it will go forward based on the direction."
	float32 flDotToChangeForwardDirectionBasedOnImpactNormal; // = 0.1
	// MPropertyDescription = "Shows debug properties."
	bool bDebug;
	// MPropertyDescription = "The distance of the trace when a book hits a surface."
	float32 flForwardTraceDistance; // = 20
	// MPropertyDescription = "The forward offset of our ground spring behavior. Allows the dragon to start rising before having to be directly on top of something."
	float32 m_flFloorRaycastForward; // = 20
	float32 m_flTraceRadius; // = 10
	float32 m_flDistanceAboveGround; // = 16
	float32 m_flFloatDownRate; // = 10
	float32 m_flClimbHeight; // = 64
	float32 m_flStepDownHeight; // = 64
	float32 m_flQAngleSmoothRate; // = 10
	bool m_bShouldReflectAgainstWall;
};
