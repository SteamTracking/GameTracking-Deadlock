// MHasKV3TransferPolymorphicClassname
class CAbilityHoldMelee_VData : public CAbilityMeleeVData
{
	CUtlOrderedMap< EMeleeHold_AttackType, AttackData_t > m_mapAttacks;
	float32 m_flLightMeleeAnimChainTime; // = 1
	float32 m_flMinDashTime;
	bool m_bUseCasterFacing;
	CRemapFloat m_AirMeleeUpScale;
	CPiecewiseCurve m_HeavyTurnSpeedCurve;
	float32 m_flCameraMaxTurnRate; // = 200
	float32 m_flHeavyMeleeMaxTurnRate; // = 140
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HoldBeginEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SuccessfulParryParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ParryActivateParticle;
	// MPropertyStartGroup = "Camera"
	CitadelCameraOperationsSequence_t m_cameraSequenceHoldStart; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
	CitadelCameraOperationsSequence_t m_cameraSequenceHitImpact; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
	CitadelCameraOperationsSequence_t m_cameraSequenceMiss; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
	// MPropertyStartGroup = "Sounds"
	// MPropertyDescription = "Sound to play when starting the hold"
	CSoundEventName m_strHoldBegin;
	CSoundEventName m_strSuccessfulParrySound;
};
