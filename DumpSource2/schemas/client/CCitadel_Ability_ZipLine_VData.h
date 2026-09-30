// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_ZipLine_VData : public CitadelAbilityVData
{
	// MPropertyDescription = "After using a zipline, players will have this air drag value applied to them until they touch the ground."
	float32 m_flZiplineAirDrag; // = 0.25
	float32 m_flZiplineAirDragBoosted; // = 2.5
	float32 m_flMinButtonHoldTimeToActivate; // = 0.2
	float32 m_flRestrictedLookTolerance; // = 100
	float32 m_flCrouchDropSpeedFraction; // = 1
	float32 m_flCrouchDropAirDragSuppressDuration; // = 1
	float32 m_flDetachDisallowedTime; // = 0.5
	float32 m_flCameraWobbleIntensity; // = 0.2
	float32 m_flDismountSpeedMax; // = 1574.800049
	float32 m_flDismountSpeedMaxBrawl; // = 800
	float32 m_flZiplineKnockdownUpImpulse; // = 100
	float32 m_flZiplineIntroDuration; // = 3
	// MPropertyDescription = "The DOF settings to apply while riding the zipline."
	DOFDesc_t m_DOFWhileZiplining;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ZipLinePreviewParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ZipLineSpeedParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ZipLineTetherParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ZipLineTetherAttachParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ZipLineTetherStartParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ZipLineEnemyKnockdownProtectionParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ZipLineSelfKnockdownProtectionParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ZipLineKnockdownProtectionStatusParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strZipLineSummonSound;
	CSoundEventName m_strZipLineStartSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_RidingZipLineModifier;
	CEmbeddedSubclass< CCitadelModifier > m_KnockedOffSlowModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ZipLineIntroModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ZipLineKnockdownImmuneModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ZipLineSlowModifier;
	// MPropertyStartGroup = "Camera"
	CitadelCameraOperationsSequence_t m_cameraSequenceAwaitingTether; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
	CitadelCameraOperationsSequence_t m_cameraSequenceLatched; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
	CitadelCameraOperationsSequence_t m_cameraSequenceAttached; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
	CitadelCameraOperationsSequence_t m_cameraSequenceClear; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
};
