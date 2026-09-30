// MHasKV3TransferPolymorphicClassname
class CNPC_ShieldedSentryVData : public CNPC_SimpleAnimatingAIVData
{
	float32 m_flZShootPostionOffset;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_LaserSightParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_KillExplosionParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AutoDestructParticle;
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DeployProgressModifier;
	CEmbeddedSubclass< CCitadelModifier > m_NearDeathModifier;
	CEmbeddedSubclass< CCitadelModifier > m_IntrinsicModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_sSpawnSound;
	CSoundEventName m_sKillExplosionSound;
	CSoundEventName m_sLastHitSound;
	CSoundEventName m_sTargetAcquiredLocalSound;
	CSoundEventName m_sTargetAcquiredSound;
	// MPropertyStartGroup = "Stats"
	float32 m_flIdleTurnSpeed; // = 30
	float32 m_flIdleTurnAngles; // = 45
	float32 m_flTrooperTakeDamageMult; // = 1
	float32 m_flNeutralTakeDamageMulti; // = 1.5
	float32 m_flNotifyEventTime; // = 1.5
	float32 m_flNearDeathDuration; // = 0.8
	float32 m_flMinimapRevealTime; // = 3
	float32 m_flMinLifetime;
	float32 m_flAttackThinkTime; // = 0.01
};
