// MHasKV3TransferPolymorphicClassname
class CAI_NPC_TrooperVData : public CAI_CitadelNPCVData
{
	TrooperType_t m_TrooperType; // = "TROOPER_NORMAL"
	float32 m_flNearDeathDuration;
	float32 m_flFlySpeed;
	float32 m_flFlyHeight;
	float32 m_flMeleeDamage;
	float32 m_flMeleeDuration;
	float32 m_flMeleeHitTime;
	float32 m_flMeleeChargeRange;
	// MPropertyStartGroup = "Combat"
	float32 m_flDPSPctGrowthPerMinute;
	// MPropertyFriendlyName = "Boss Weapon Name"
	// MPropertyDescription = "Key into "Weapon Infos" used when the enemy is a boss class. Leave empty to always use the requested weapon info."
	CGlobalSymbol m_BossWeaponName;
	// MPropertyStartGroup = "Enemy VS"
	TrooperVsConfig_t m_VSPlayer;
	TrooperVsConfig_t m_VSTrooper;
	TrooperVsConfig_t m_VSGuardian;
	TrooperVsConfig_t m_VSWalker;
	TrooperVsConfig_t m_VSWatcher;
	TrooperVsConfig_t m_VSShrine;
	TrooperVsConfig_t m_VSPatron;
	TrooperVsConfig_t m_VSPatronPhase2;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BossAttackParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_LastHitParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TargetingLaserParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TargetingEyeFlashParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_sZiplineContainerBreakFromDamageParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_sZiplineContainerBreakFromLandingParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_MedicHealActiveParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HeadHealthChangeAmberParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HeadHealthChangeSapphireParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_sPlayerLastHitSound;
	CSoundEventName m_sZiplineContainerBreakSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ShrinesDownBuffModifier;
};
