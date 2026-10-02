// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Ratking_StandardBearerVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_PlantedModifier;
	CEmbeddedSubclass< CCitadelModifier > m_EnemyFlagAuraModifier;
	CEmbeddedSubclass< CCitadelModifier > m_AllyFlagAuraModifier;
	CEmbeddedSubclass< CCitadelModifier > m_CasterModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_FlagPlantSound;
	CSoundEventName m_ChargeImpactSound;
	CSoundEventName m_strChargeLoopSound;
	// MPropertyStartGroup = "Gameplay"
	// MPropertyDescription = "How far from abs origin in the z do we start the plant check."
	float32 m_flPlantFlagZStart; // = 100
	float32 m_flDownTraceDistance; // = 200
	// MPropertyDescription = "Seconds after the banner is planted before the sewer erupts and the auras switch on."
	float32 m_flExplodeTimer; // = 0.25
	// MPropertyDescription = "How fast he builds up to full charge speed."
	float32 m_flChargeAccelerationMeters; // = 30
	// MPropertyDescription = "Turn rate in degrees per second while charging slowly."
	float32 m_flTurnRateMax; // = 150
	// MPropertyDescription = "Turn rate in degrees per second at full charge speed."
	float32 m_flTurnRateMin; // = 80
	float32 m_flFlagForwardDistance; // = 100
	// MPropertyDescription = "How far above the ground to still be grounded while charging"
	float32 m_flNearGroundDistance; // = 24
	// MPropertyDescription = "How far above the ground the plant animation starts while he's slamming down"
	float32 m_flPlantAnticipationDistance; // = 100
	// MPropertyDescription = "Rise speed of the hop before he plants, before the curve scales it."
	float32 m_flPlantLeapUpSpeed; // = 300
	// MPropertyDescription = "How long the rise lasts."
	float32 m_flPlantLeapRiseDuration; // = 0.45
	// MPropertyDescription = "Rise speed multiplier over the rise"
	CPiecewiseCurve m_PlantLeapSpeedCurve;
	// MPropertyDescription = "Charge speed multiplier over the rise"
	CPiecewiseCurve m_PlantLeapHorizontalCurve;
	// MPropertyDescription = "How long he holds his height at the apex before slamming down"
	float32 m_flPlantLeapHoverDuration; // = 0.2
	// MPropertyDescription = "Downward speed of the slam out of the apex."
	float32 m_flPlantLeapSlamSpeed; // = 900
	// MPropertyDescription = "Upward speed of the little hop he does after planting the banner. 0 disables the hop."
	float32 m_flPlantPopUpSpeed; // = 250
	// MPropertyDescription = "Backward speed (away from the banner) of the hop he does after planting."
	float32 m_flPlantPopBackSpeed; // = 150
	// MPropertyDescription = "Prediction headroom after a stun/root/sleep clears."
	float32 m_flRecoveryDelay; // = 0.3
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_FlagModel;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AnticipationParticle;
	// MPropertyStartGroup = "Camera"
	CitadelCameraOperationsSequence_t m_ChargingCameraSequence; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
	// MPropertyDescription = "Replaces the charging sequence from the start of the plant leap rise until the leap ends."
	CitadelCameraOperationsSequence_t m_PlantLeapCameraSequence; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
};
