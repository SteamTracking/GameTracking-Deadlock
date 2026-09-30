// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Familiar_HelpingHandsVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_AIPhysicsModifier;
	CEmbeddedSubclass< CCitadelModifier > m_AIAggroModifier;
	CEmbeddedSubclass< CCitadelModifier > m_InvisWatcherModifier;
	CEmbeddedSubclass< CCitadelModifier > m_InfestModifier;
	CEmbeddedSubclass< CCitadelModifier > m_InfestWaitingModifier;
	CEmbeddedSubclass< CCitadelModifier > m_InfestBarrierModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strHelperShootSound;
	CSoundEventName m_strHelperSpawnSound;
	CSoundEventName m_strHelperEmoteSound;
	CSoundEventName m_strHelperFoundEnemySound;
	CSoundEventName m_strHelperHealTroopSound;
	CSoundEventName m_strHelperScaredSound;
	CSoundEventName m_strHelperBuffSound;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_EmoteParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HealParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DamageParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DamageAttachedParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastRegionIndicatorParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AuraIndicatorParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AuraInactiveParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HelperCreateParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HelperDestroyParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HelperParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HelperSleepingParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HelperAttackingParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HelperStunnedParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HelperChargingUpParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HelperAttachedParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HelperTeleportOutParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HelperTeleportInParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HelperTargetIndicateParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_InfestedParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_InfestedHeroParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ScaredParticle;
	// MPropertyStartGroup = "Collision"
	float32 m_flCollisionSize;
	float32 m_flCollisionHeight;
	// MPropertyStartGroup = "Damaging Jump"
	float32 m_flLaunchBiasUp;
	float32 m_flLaunchSpeedMult;
	float32 m_flLaunchMaxSpeed;
	float32 m_flHomingBias;
	float32 m_flDamageCollisonScale; // = 1
	// MPropertyStartGroup = "Emote"
	CPiecewiseCurve m_EmoteVelocityZByTime;
	CPiecewiseCurve m_EmoteSpinByTime;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flNewlySpawnedWaitTime;
	float32 m_flHealInterval;
	float32 m_flSpawnLaunchUpBias;
	float32 m_flSpawnLaunchForce;
	float32 m_flMoveTolerance_Meters;
	float32 m_flMoveTolerance_UnitTarget_Meters;
	float32 m_flTolerance_FarFromPlayer_Meters;
	float32 m_flTolerance_CloseToPlayer_Meters;
	CPiecewiseCurve m_PatrolTravelTimeByDistance;
	float32 m_flInfestedNPCModelScale;
};
