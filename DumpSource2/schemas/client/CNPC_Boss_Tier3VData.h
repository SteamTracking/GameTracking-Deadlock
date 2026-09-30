// MHasKV3TransferPolymorphicClassname
class CNPC_Boss_Tier3VData : public CAI_CitadelNPCVData
{
	float32 m_flAllyPitTimeMin; // = 2
	int32 m_nPhase2Health; // = 18000
	float32 m_flEyeZOffset; // = 500
	float32 m_flEnemyTrooperProtectionRange; // = 1575
	Vector m_vPhase1ObserverOrigin;
	Vector m_vPhase2ObserverOrigin;
	float32 m_flPhase1ObserverPitch; // = 40
	float32 m_flPhase2ObserverPitch; // = 30
	float32 m_flPhase2MaxAnimSpinRate; // = 10
	float32 m_flPhase2AttackBias; // = 0.5
	float32 m_flRotateSpeed; // = 0.3
	float32 m_flPhase2SightRange; // = 600
	float32 m_flCoreRadius; // = 120
	float32 m_flCoreDeathTime; // = 3
	float32 m_flTransitionLightTime01;
	float32 m_flTransitionLightTime02; // = 1
	float32 m_flTransitionLightTime03; // = 2
	float32 m_flTransitionLightTime04; // = 3
	// MPropertyStartGroup = "Shrine Gameplay"
	float32 m_flShrineAttackHealthLossPerAttack; // = 0.15
	float32 m_flShrineAttackMinTimeBetweenAttacks; // = 10
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AmberEffigyExplosionParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AmberTransformUpExplosionParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AmberBeginDyingParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AmberDeathLargeExplosionParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AmberHitResponseParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AmberPhase2AmbientParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SapphEffigyExplosionParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SapphTransformUpExplosionParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SapphBeginDyingParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SapphDeathLargeExplosionParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SapphHitResponseParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SapphPhase2AmbientParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PatronTransformDownEyeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_strWIPModelName;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_strTeamAmberModel;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_AmberEffigyModel;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_SapphEffigyModel;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_AmberCoreModel;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_SapphCoreModel;
	float32 m_flCoreVerticalOffset;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_PatronTransformStartSound;
	CSoundEventName m_PatronKilledSound;
	CSoundEventName m_EffigySapphireExplodeSound;
	CSoundEventName m_EffigyAmberExplodeSound;
	CSoundEventName m_AmberReformSound;
	CSoundEventName m_SapphireReformSound;
	CSoundEventName m_AmberReformingLoopSound;
	CSoundEventName m_SapphireReformingLoopSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_LaserBeamModifier;
	CEmbeddedSubclass< CBaseModifier > m_DyingModifier;
	CEmbeddedSubclass< CBaseModifier > m_VulnerableModifier;
	CEmbeddedSubclass< CBaseModifier > m_Phase1Modifier;
	CEmbeddedSubclass< CBaseModifier > m_EffigyModifier;
	CEmbeddedSubclass< CBaseModifier > m_Phase2DamagePulseModifier;
	CEmbeddedSubclass< CBaseModifier > m_BackdoorProtection;
	CEmbeddedSubclass< CBaseModifier > m_RangedArmorModifier;
	CEmbeddedSubclass< CBaseModifier > m_ObjectiveRegen;
	CEmbeddedSubclass< CBaseModifier > m_ObjectiveHealthGrowthPhase1;
	CEmbeddedSubclass< CBaseModifier > m_ObjectiveHealthGrowthPhase2;
	CEmbeddedSubclass< CBaseModifier > m_DefenderInPitInvulnerable;
	// MPropertyStartGroup = "Laser"
	float32 m_flLaserMoveSpeed; // = 200
	float32 m_flLaserCooldownPhase1; // = 10
	float32 m_flLaserCooldownPhase2; // = 15
	float32 m_flLaserDurationPhase1; // = 4.5
	float32 m_flLaserDurationPhase2; // = 3
	// MPropertyStartGroup = "TransitionProperties"
	float32 m_flPhase1DyingBegin; // = 3
	float32 m_flPhase1DyingDrop; // = 1
	float32 m_flPhase2DyingDropScale; // = 0.1
	float32 m_flPhase1DyingWait; // = 6
	float32 m_flPhase1DyingTransformUp; // = 1
	float32 m_flPhase1BossScale; // = 0.75
	float32 m_flPhase2BossScale; // = 0.6
	float32 m_flPostShrineTransition; // = 2
	// MPropertyStartGroup = "Arm Attacks"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ArmAttackGroundHit;
	float32 m_flArmAttackHealthMin; // = 0.2
	float32 m_flArmAttackHealthMax; // = 0.8
	float32 m_flArmAttackCooldownMin; // = 4
	float32 m_flArmAttackCooldownMax; // = 10
	float32 m_flArmAttackTimeToHit; // = 1.23
	float32 m_flArmAttackRadius; // = 100
	float32 m_flArmAttackPosDotThres; // = 0.5
	float32 m_flArmAttackDamage; // = 150
	float32 m_flArmAttackKnockbackStrength; // = 400
	float32 m_flArmAttackInvulCooldownScale; // = 2
};
