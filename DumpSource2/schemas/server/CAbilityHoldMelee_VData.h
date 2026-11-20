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
	CitadelCameraOperationsSequence_t m_cameraSequenceHoldStart;
	CitadelCameraOperationsSequence_t m_cameraSequenceHitImpact;
	CitadelCameraOperationsSequence_t m_cameraSequenceMiss;
	// MPropertyStartGroup = "Sounds"
	// MPropertyDescription = "Sound to play when starting the hold"
	CSoundEventName m_strHoldBegin;
	CSoundEventName m_strSuccessfulParrySound;
};
