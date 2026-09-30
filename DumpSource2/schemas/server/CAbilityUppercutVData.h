// MHasKV3TransferPolymorphicClassname
class CAbilityUppercutVData : public CAbilityMeleeVData
{
	AttackData_t m_UppercutAttackData; // = { "_class": "AttackData_t", "bIsHeavyAttack": false, "m_MeleeActivateParticle": "particles/abilities/melee/melee_activate.vpcf", "m_MeleeAttackParticle": "", "m_MeleeImpactParticle": "particles/abilities/melee_impact.vpcf", "m_MeleeSwingParticle": "particles/abilities/melee_swing.vpcf", "m_MovementSpeedCurve": { "m_spline": [  ], "m_tangents": [  ], "m_vDomainMaxs": [ 0, 0 ], "m_vDomainMins": [ 0, 0 ] }, "m_SpeedBonusCurve": { "m_spline": [  ], "m_tangents": [  ], "m_vDomainMaxs": [ 0, 0 ], "m_vDomainMins": [ 0, 0 ] }, "m_Trigger": "", "m_bApplyScreenShake": false, "m_bCanBeParried": true, "m_bParryOnlyBlocksParrier": false, "m_bParryStunsAttacker": true, "m_bWaitForGroundToTrigger": false, "m_cameraSequenceAttackStart": { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }, "m_flAttackStateTime": 0.3, "m_flCooldownOnHit": 0, "m_flCooldownOnMiss": 0, "m_flEnemySlowOnHitDuration": 0.6, "m_flEnemySlowOnHitSpeed": 50, "m_flKnockUpStrength": 0, "m_flMovementAcc": 300, "m_flPrimaryAttackPauseDuration": 0.7, "m_flReloadPauseDuration": 1, "m_flTraceConeHalfWidth": 48, "m_strActivateSound": "", "m_strHitDebrisSound": "", "m_strHitHeroSound": "", "m_strHitSound": "", "m_strMeleeDashSound": "", "m_strMissSound": "" }
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_UppercutModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ClipModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flMaxPitchUp; // = -60
	float32 m_flDamageTriggerTime; // = 0.235
	float32 m_flMeleeLockoutDuration; // = 0.5
};
