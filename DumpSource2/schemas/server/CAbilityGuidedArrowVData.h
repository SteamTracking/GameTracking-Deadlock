// MHasKV3TransferPolymorphicClassname
class CAbilityGuidedArrowVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Camera"
	CitadelCameraOperationsSequence_t m_cameraCancelledTransitionBacktoArcher; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
	CitadelCameraOperationsSequence_t m_cameraExplodedTransitionBackToArcher; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
	float32 m_flCameraHoldAtExplosion; // = 0.4
	float32 m_flFadeIn; // = 0.2
	float32 m_flFadeHoldTime; // = 0.1
	float32 m_flFadeOut; // = 0.1
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SpectatingProjectileParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplosionParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_GuidedArrowChannelParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_ProjectileModel;
	float32 m_ArrowOffsetX; // = -100
	float32 m_ArrowCameraDistance; // = 100
	float32 m_ArrowCameraHeightOffset; // = 30
	float32 m_ArrowInitialPitch; // = -85
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_GuidingModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_KillCheckModifier;
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_strExplodeSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flTrackAmount; // = 110
	float32 m_flSpeedAccel; // = 800
	float32 m_flSpeedDeccel; // = 300
	float32 m_flBaseProjectileSpeed; // = 700
	float32 m_flMaxProjectileSpeed; // = 1400
	float32 m_flArrowModelTurnSpringStrength; // = 20
	float32 m_flKillCheckWindow; // = 3
	float32 m_flWorldCollideGraceWindow; // = 0.3
};
