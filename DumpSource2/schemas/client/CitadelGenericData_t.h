// MVDataRoot
// MVDataSingleton
class CitadelGenericData_t
{
	CUtlOrderedMap< EDamageFlashType, DamageFlashSettings_t > m_mapDamageFlash;
	CUtlOrderedMap< EDamageFlashType, DamageFlashSettings_t > m_mapDamageFlashLowViolence;
	GlitchSettings_t m_GlitchSettings;
	// MPropertyStartGroup = "Sounds"
	CUtlOrderedMap< ECurrencyType, CurrencySound_t > m_CurrencyTypeSounds;
	DamageReceivedSounds_t m_DamageReceivedSounds;
	HealingReceivedSounds_t m_HealingReceivedSounds;
	DamageIndicatorSounds_t m_DamageIndicatorSounds;
	CSoundEventName m_strExitCombatSound;
	// MPropertyStartGroup = "Particles and Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ShoppingEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_KillStreakFireParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_MidbossIndicatorRespawningParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_MidbossIndicatorSpawnedParticle;
	// MPropertyStartGroup = "MiniMap"
	CUtlVector< MinimapOffsetDesc_t > m_MiniMapOffsets;
	CUtlVector< MapDistrictDesc_t > m_MapDistrictLocalization;
	// MPropertyStartGroup = "Outline Colors"
	// MPropertyColorPlusAlpha
	Color m_OutlineColorFriend;
	// MPropertyColorPlusAlpha
	Color m_OutlineColorEnemy;
	// MPropertyColorPlusAlpha
	Color m_OutlineColorEnemyHero;
	// MPropertyColorPlusAlpha
	Color m_OutlineColorTeam1;
	// MPropertyColorPlusAlpha
	Color m_OutlineColorTeam2;
	// MPropertyColorPlusAlpha
	Color m_OutlineColorNeutral;
	// MPropertyColorPlusAlpha
	Color m_OutlineColorHighlight; // = [ 0, 255, 255 ]
	float32 m_flOutlineWidthHighlight; // = 6
	// MPropertyStartGroup = "Ziplines"
	LaneDesc_t[8] m_LaneInfo;
	// MPropertyStartGroup = "Team Colors"
	Color m_ColorFriend;
	Color m_ColorEnemy;
	Color m_ColorTeam1;
	Color m_ColorTeam2;
	// MPropertyStartGroup = ""
	NewPlayerMetrics_t[4] m_NewPlayerMetrics;
	int32[6] m_nItemPricePerTier;
	// MPropertyDescription = "Souls charged to corrupt an owned item of each tier.  Items can override this with m_nSoulCostOverride."
	int32[6] m_nItemCorruptionPricePerTier;
	// MPropertyStartGroup = "Corrupted Items"
	// MPropertyDescription = "Downsides rolled onto every corruptible item at match start.  The networked id is the index into this list, so only ever append."
	CUtlVector< CorruptedPenaltyDef_t > m_vecCorruptedPenaltyDefs;
	// MPropertyStartGroup = ""
	// MPropertyStartGroup = "Neutral Camps"
	// MPropertyDescription = "Meters from a neutral camp within which its respawn timer is shown in the world."
	float32 m_flNeutralCampRespawnTimerShowDistance; // = 15
	// MPropertyDescription = "Meters from the mid boss within which its respawn timer is shown in the world."
	float32 m_flMidBossRespawnTimerShowDistance; // = 30
	// MPropertyDescription = "Meters above the camp origin that the respawn timer floats."
	float32 m_flNeutralCampRespawnTimerHeight; // = 2.5
	// MPropertyStartGroup = ""
	// MPropertyStartGroup = "Pickups"
	// MPropertyDescription = "Seconds between consecutive overhead buff models on the same player, so buffs gained together play one after another instead of on top of each other."
	float32 m_flPickupGainedEffectStaggerInterval; // = 1.5
	// MPropertyDescription = "Seconds each stat line from a permanent buff pickup stays on screen."
	float32 m_flPermanentPickupTextDuration; // = 3
	// MPropertyStartGroup = ""
	float32[6] m_flTrooperKillGoldShareFrac;
	float32[6] m_flHeroKillGoldShareFrac;
	DOFDesc_t m_DefaultDOF;
	RejuvinatorParams_t m_RejuvParams;
	IdolParams_t m_IdolParams;
	KothParams_t m_KothParams;
	TeleporterParams_t m_TeleporterParams;
	ObjectivesParams_t m_ObjectiveParams;
	BreakablePowerupLootParams_t m_BreakablePowerupLootParams;
	CUtlVector< BreakableSpawnTimeDesc_t > m_BreakableSpawnTimeDesc;
	CUtlOrderedMap< EStatsType, CUtlString > m_mapStatTypeImages;
	// MPropertyDescription = "Remap camera angle delta to aim spring strength"
	CRemapFloat m_AimSpringStrength;
	// MPropertyDescription = "Remap camera angle delta to ability targeting spring strength"
	CRemapFloat m_TargetingSpringStrength;
	CUtlOrderedMap< EAbilityResourceType, HeroAbilityResourceDef_t > m_mapResourceTypes;
	// MPropertyStartGroup = "New Shop Groups"
	CUtlVector< ShopGroups_t > m_vecWeaponGroups;
	CUtlVector< ShopGroups_t > m_vecArmorGroups;
	CUtlVector< ShopGroups_t > m_vecSpiritGroups;
	// MPropertyFlattenIntoParentRow
	// MPropertyStartGroup = "Street Brawl"
	GameModeStreetBrawl_t m_StreetBrawl;
};
