// MHasKV3TransferPolymorphicClassname
class AttackData_t
{
	// MPropertyDescription = "When this attack is used, pause weapon reloads for this long"
	float32 m_flReloadPauseDuration; // = 1
	// MPropertyDescription = "When this attack is used, pause shooting for this long"
	float32 m_flPrimaryAttackPauseDuration; // = 0.7
	// MPropertyDescription = "Enemies are slowed for this duration when hit by this attack"
	float32 m_flEnemySlowOnHitDuration; // = 0.6
	// MPropertyDescription = "Enemies are slowed to this speed when hit by this attack"
	float32 m_flEnemySlowOnHitSpeed; // = 50
	// MPropertyDescription = "Is this a Heavy melee attack? Otherwise it's considered light."
	bool bIsHeavyAttack;
	// MPropertyDescription = "When true, this attack can be parried"
	bool m_bCanBeParried; // = true
	// MPropertyDescription = "When true, a parry only protects the parrier. The attacker is still parried, but everyone else it caught is hit as normal."
	bool m_bParryOnlyBlocksParrier;
	// MPropertyDescription = "When false, a parry still blocks this attack's damage but does not stun the attacker."
	bool m_bParryStunsAttacker; // = true
	// MPropertyDescription = "How long after triggering until we can perform another melee attack"
	float32 m_flCooldownOnMiss;
	float32 m_flCooldownOnHit;
	// MPropertyDescription = "Half width of the cone at the player"
	float32 m_flTraceConeHalfWidth; // = 48
	// MPropertyDescription = "How much force to apply upward on hit"
	float32 m_flKnockUpStrength;
	// MPropertyDescription = "Trigger a big screen shake when this attack hits"
	bool m_bApplyScreenShake;
	// MPropertyDescription = "The curve defining move speed bonus/penalty.  This is how we apply the post-movement controller movement slow."
	CPiecewiseCurve m_SpeedBonusCurve;
	// MPropertyDescription = "The curve defining movement controller target speed.  This is what defines the speed boost"
	CPiecewiseCurve m_MovementSpeedCurve;
	// MPropertyDescription = "How much acceleration to apply to use when following the movement speed curve"
	float32 m_flMovementAcc; // = 300
	// MPropertyDescription = "How long to be in the attacking state once the attack triggers"
	float32 m_flAttackStateTime; // = 0.3
	// MPropertyDescription = "When true, an attack started in the air holds off triggering until the caster lands. The air dash curve still runs first, so a flat curve gives a wind-up that simply waits for the ground."
	bool m_bWaitForGroundToTrigger;
	// MPropertyDescription = "Animgraph trigger parameter for this attack"
	CGlobalSymbol m_Trigger;
	// MPropertyStartGroup = "Sounds"
	// MPropertyDescription = "Sound to play when this attack activates"
	CSoundEventName m_strActivateSound;
	// MPropertyDescription = "Sound to play if this attack hits"
	CSoundEventName m_strHitSound;
	CSoundEventName m_strHitHeroSound;
	CSoundEventName m_strHitDebrisSound;
	// MPropertyDescription = "Sound to play if this attack misses"
	CSoundEventName m_strMissSound;
	// MPropertyDescription = "Sound to play when starting the movement dash of this attack"
	CSoundEventName m_strMeleeDashSound;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_MeleeActivateParticle; // = "particles/abilities/melee/melee_activate.vpcf"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_MeleeSwingParticle; // = "particles/abilities/melee_swing.vpcf"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_MeleeAttackParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_MeleeImpactParticle; // = "particles/abilities/melee_impact.vpcf"
	// MPropertyStartGroup = "Camera"
	CitadelCameraOperationsSequence_t m_cameraSequenceAttackStart; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
};
