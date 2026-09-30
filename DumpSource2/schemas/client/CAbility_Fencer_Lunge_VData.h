// MHasKV3TransferPolymorphicClassname
class CAbility_Fencer_Lunge_VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DashImpactEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DashSwingEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DashTrailEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SwordChargeEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SlashSwingEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_StackProcParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_GlintParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PerfectImpactParticle;
	// MPropertyDescription = "Visual offset for the origin of the long-slash particle effect"
	Vector m_vecLongEffectOffset;
	float32 m_vecPlayerLeftOffset;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DashBuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_UIRecastModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flAirSpeedMax; // = 1
	float32 m_flAirDrag; // = 1
	float32 m_flFallSpeedMax; // = 1
	float32 m_flDashTurnRateMax; // = 100
	float32 m_flMaxPowerPadding; // = 0.2
	float32 m_flEffectGroundTrace; // = 32
	float32 m_flWhizbyMaxRange; // = 180
	float32 m_flStartPosTestCapsuleLength; // = 100
	float32 m_flCoverLOSBackDist; // = 100
	float32 m_flAttackDuration; // = 0.25
	float32 m_flPostAttackDuration; // = 0.1
	float32 m_flMinGlintTime; // = 0.1
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strDashStart;
	CSoundEventName m_strSlashStart;
	CSoundEventName m_strSlashImpactSound;
	CSoundEventName m_strChargeSound;
	CSoundEventName m_strChargeGlintSound;
	CSoundEventName m_strMaxHoldSweetener;
	CSoundEventName m_strPerfectDamageHitSound;
	// MPropertyStartGroup = "Camera"
	CitadelCameraOperationsSequence_t m_cameraSequencePreRelease; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
	CitadelCameraOperationsSequence_t m_cameraSequenceSlash; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
};
