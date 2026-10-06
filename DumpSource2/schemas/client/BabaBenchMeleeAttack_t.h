// MHasKV3TransferPolymorphicClassname
class BabaBenchMeleeAttack_t
{
	bool m_bIsHeavyAttack;
	float32 m_flChargeTime;
	float32 m_flAttackStateTime; // = 0.3
	float32 m_flCooldownOnHit;
	float32 m_flCooldownOnMiss;
	float32 m_flTraceConeHalfWidth; // = 48
	float32 m_flEnemySlowOnHitDuration; // = 0.6
	float32 m_flEnemySlowOnHitSpeed; // = 50
	float32 m_flKnockUpStrength;
	float32 m_flPrimaryAttackPauseDuration; // = 0.7
	float32 m_flReloadPauseDuration; // = 1
	bool m_bCanBeParried; // = true
	bool m_bParryOnlyBlocksParrier;
	bool m_bParryStunsAttacker; // = true
	bool m_bApplyScreenShake;
	bool m_bWaitForGroundToTrigger;
	CPiecewiseCurve m_MovementSpeedCurve;
	CPiecewiseCurve m_SpeedBonusCurve;
	float32 m_flMovementAcc; // = 300
	float32 m_flAttackImpulse;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strMeleeDashSound;
	CSoundEventName m_strHitSound;
	CSoundEventName m_strHitHeroSound;
	CSoundEventName m_strHitDebrisSound;
	CSoundEventName m_strMissSound;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_MeleeSwingParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_MeleeAttackParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_MeleeImpactParticle;
	// MPropertyStartGroup = "Camera"
	CitadelCameraOperationsSequence_t m_cameraSequenceAttackStart; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
};
