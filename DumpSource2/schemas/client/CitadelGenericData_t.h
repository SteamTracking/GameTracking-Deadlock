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
	HealingReceivedSounds_t m_HealingReceivedSounds; // = { "m_HOTLoopSounds": {  }, "m_nPriority": 1, "m_strDirectHealingMedium": "", "m_strDirectHealingSmall": "", "m_strHOTToppedOff": "", "m_strHighThresholdOneshot": "" }
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
	RejuvinatorParams_t m_RejuvParams; // = { "m_PlayerRespawnMult": [  ], "m_TrooperHealthMult": [  ], "m_flRejuvinatorBuffDuration": 240, "m_flRejuvinatorDropDuration": 7, "m_flRejuvinatorDropHeight": 500, "m_flRejuvinatorExpirationWarningTiming": 30, "m_flRejuvinatorRebirthDuration": [ 0, 0, 0 ], "m_strRejuvPickupSound": "" }
	IdolParams_t m_IdolParams; // = { "m_CrateModel": "", "m_IdolDroppingParticle": "", "m_IdolModel": "", "m_IdolReturnLocationParticle": "", "m_IdolSpawnCompleteSound": "", "m_IdolSpawnLocationParticle": "", "m_IdolSpawnSound": "", "m_ParachuteModel": "", "m_flIdolDropDuration": 25, "m_flIdolDropHeight": 1800, "m_flIdolReturnLocationParticleScale": 1, "m_strLoopingSequenceName": "" }
	KothParams_t m_KothParams; // = { "m_KothEarlyWarningParticle": "", "m_KothOnSpawnParticle": "", "m_KothSpawnLocationParticle": "", "m_flKothRadius": 20, "m_flKothWarningDropHeight": 60, "m_strKothPreSpawnLoopSound": "", "m_strKothSpawnCompleteSound": "", "m_strKothSpawnLoopSound": "", "m_strKothSpawnLoopStartSound": "" }
	TeleporterParams_t m_TeleporterParams;
	ObjectivesParams_t m_ObjectiveParams; // = { "m_GoldPerOrb": 0, "m_NearPlayerSplitPct": 60, "m_nBaseGuardiansGoldKill": 750, "m_nBaseGuardiansGoldOrbs": 0, "m_nPatronPhase1GoldKill": 0, "m_nPatronPhase1GoldOrbs": 0, "m_nShrinesGoldKill": 0, "m_nShrinesGoldOrbs": 0, "m_nTier1GoldKill": 1650, "m_nTier1GoldOrbs": 0, "m_nTier2GoldKill": 4500, "m_nTier2GoldOrbs": 0 }
	BreakablePowerupLootParams_t m_BreakablePowerupLootParams; // = { "m_iLootListDeckSize": 1, "m_mapPickupsByMatchTimeMins": {  } }
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
	GameModeStreetBrawl_t m_StreetBrawl; // = { "m_flActivesReductionWeightScale": 0.35, "m_flBuyTimeGracePeriod": 15, "m_flComebackWeightScale_Trailing_1": 2, "m_flComebackWeightScale_Trailing_2": 8, "m_flEnhancedOwnerSkipChancePct": 75, "m_flLegendaryOwnerSkipChancePct": 95, "m_flOvertimeRespawnTimeIncrease": [  ], "m_flOvertimeRespawnTimeIncreaseUrgent": [  ], "m_flOvertimeTrooperDamageScale": [  ], "m_flOvertimeTrooperHealthScale": [  ], "m_flPreScoringTime": 1, "m_flRareWeightScale": 2, "m_flScoringGameTimeScale": 0.5, "m_flScoringTime": 5, "m_flTier1MaxResistTime": 4, "m_flTier2MaxResistTime": 4, "m_flTrooperNonOvertimeResist": 20, "m_flTrooperOvertimeResist": 20, "m_flTrooperSpawnBeforeRoundStartTimer": 5, "m_flTrooperSpawnTimer": [  ], "m_flZipBoostCooldownOnStart": 20, "m_iCorruptItemRound": 0, "m_iLaneNumber": 4, "m_iScoreToWin": 3, "m_iUltimateUnlockRound": 0, "m_mapItemTierToItemDraftBuckets": {  }, "m_nComebackBonusHealth": 1000, "m_nComebackBonusHealthCritical": 4000, "m_nMatchLengthMinutes": 18, "m_nTier2BonusHealth": 4000, "m_strAmberTrooperPickupToDrop": "", "m_strSapphireTrooperPickupToDrop": "", "m_strTrooperModifier": "", "m_vecAPPerRound": [  ], "m_vecBuyTime": [  ], "m_vecGoldPerRound": [  ], "m_vecItemDraftRerollsPerRound": [  ], "m_vecItemDraftRoundsPerGameRound": [  ], "m_vecObjectiveMaxHealth": [  ], "m_vecPreBuyTime": [  ], "m_vecRespawnTimes": [  ], "m_vecRoundLengthMinutes": [  ], "m_vecRoundLengthMinutesUrgent": [  ] }
};
