// MHasKV3TransferPolymorphicClassname
class CNPC_Boss_Tier2VData : public CAI_CitadelNPCVData
{
	float32 m_flPlayerInitialSightRange; // = 1000
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_strWIPModelName;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_BeamHitSound;
	CSoundEventName m_BeamAnnounceSound;
	CSoundEventName m_BarrageAnnounceSound;
	CSoundEventName m_MeleeAnnounceSound;
	// MPropertyStartGroup = "Electric Beam (Laser)"
	bool m_bBeamTurnToFire; // = true
	// MPropertyStartGroup = "Stomp"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_StompImpactEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_StompWarningEffect;
	float32 m_flTossSpeed;
	float32 m_flStompDamage;
	float32 m_flStompDamageMaxHealthPercent; // = 10
	float32 m_flStompDamageTrooperRate; // = 0.3
	float32 m_flStompTossUpMagnitude;
	float32 m_flStunDuration;
	float32 m_flStompAttemptRadius;
	float32 m_flStompImpactRadius;
	float32 m_flStompImpactHeight;
	float32 m_flStompParryRadius;
	float32 m_flStompParryImpulse;
	float32 m_flStompParryImpulseInAir;
	float32 m_flStompParryDamageMult; // = 1
	CSoundEventName m_StompAnnounceSound;
	CSoundEventName m_StompParriedSound;
	CSoundEventName m_StompImpactSound;
	// MPropertyStartGroup = "Range Rings"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_RangeRingParticle;
	float32 m_flRangeRingShowDistance; // = 472.440002
	float32 m_flRangeRingFadeDistance; // = 196.850006
	float32 m_flRangeRingAlpha; // = 0.8
	// MPropertyStartGroup = "Gun"
	float32 m_flBurstDuration;
	float32 m_flBurstCooldown;
	// MPropertyStartGroup = "Melee"
	float32 m_flMeleeDuration;
	float32 m_flMeleeHitTime;
	float32 m_flMeleeAttackRadius;
	float32 m_flMeleeDamage;
	float32 m_flMeleeDamageHealthPct;
	float32 m_flMeleeTrooperStunTime; // = 3
	// MPropertyStartGroup = "Modifiers"
	// MPropertyDescription = "Backdoor Protection Modifier"
	CEmbeddedSubclass< CCitadelModifier > m_BackdoorProtectionModifier;
	float32 m_flBackDoorProtectionRange; // = 2750
	CEmbeddedSubclass< CCitadelModifier > m_InvulModifier;
	float32 m_flInvulModifierRange; // = 1200
	CEmbeddedSubclass< CCitadelModifier > m_RangedArmorModifier;
	CEmbeddedSubclass< CCitadelModifier > m_FriendlyAuraModifier;
	CEmbeddedSubclass< CCitadelModifier > m_NearbyEnemyResist;
	CEmbeddedSubclass< CCitadelModifier > m_StatTrackerAuraModifier;
	CEmbeddedSubclass< CCitadelModifier > m_EmpoweredModifierLevel1;
	CEmbeddedSubclass< CCitadelModifier > m_EmpoweredModifierLevel2;
	CEmbeddedSubclass< CCitadelModifier > m_StaggerWatcherModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flMaxStaggerBuildup; // = 5
	float32 m_flStaggerDuration; // = 6
	float32 m_flStaggerMeleeMult; // = 2
	float32 m_flStaggerDamageMult; // = 1.3
	float32 m_flAoeWaveHealthThreshold; // = 0.35
};
