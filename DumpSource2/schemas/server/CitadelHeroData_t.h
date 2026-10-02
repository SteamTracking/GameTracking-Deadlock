// MVDataRoot
// MVDataAssociatedFile = "scripts/heroes.vdata"
// MVDataOverlayType = 1
// MHasKV3TransferPolymorphicClassname
class CitadelHeroData_t
{
	CUtlVector< HeroAnimGraphDefaultValueOverride_t > m_vecAnimGraphDefaultValueOverrides;
	HeroID_t m_HeroID;
	CUtlString m_strHeroSortName;
	CUtlString m_strHeroSearchName;
	CUtlString m_strHeroGender;
	// MPropertyStartGroup = "Screen Space Particle FX"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_hDamageTakenParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_hGroundDamageTakenParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_hDeathParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_hLowHealthParticle;
	// MPropertyStartGroup = "Visuals"
	CPanoramaImageName m_strIconImageSmall;
	CPanoramaImageName m_strIconHeroCard;
	CPanoramaImageName m_strIconHeroCardCritical;
	CPanoramaImageName m_strIconHeroCardGloat;
	CPanoramaImageName m_strMinimapImage;
	CPanoramaImageName m_strTopBarVertical;
	CPanoramaImageName m_strVoteSticker;
	CPanoramaImageName m_strLogoImageEnglish;
	CPanoramaImageName m_strLogoImageLocalized;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_hRespawnParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_hVisibilityParticle;
	Color m_colorUI;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_strModelName;
	int32 m_nModelSkin;
	// MPropertyDescription = "If specified, this model will be used if convar citadel_use_wip_models is true."
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_strWIPModelName;
	// MPropertyDescription = "If specified, this model will be used in main instead of 'Model Name'."
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_strMainOnlyModelName;
	// MPropertyDescription = "When set, also use the 'Main Only Model Name' in the Experimental branch"
	bool m_bUseMainOnlyModelForExperimental; // = true
	// MPropertyStartGroup = "UI"
	// MPropertyAttributeEditor = "AssetBrowse( vmap )"
	CUtlString m_strUIPortraitMap;
	// MPropertyAttributeEditor = "AssetBrowse( vmap )"
	CUtlString m_strUIShoppingMap;
	// MPropertyAttributeEditor = "AssetBrowse( vmap )"
	CUtlString m_strUITeamRevealMap;
	// MPropertyAttributeEditor = "AssetBrowse( vmap )"
	CUtlString m_strUIPostgamePortraitMap;
	// MPropertyAttributeEditor = "AssetBrowse( vmap )"
	CUtlString m_strUIHeroRevealMap;
	HeroStatsUI_t m_heroStatsUI; // = { "m_eWeaponStatDisplay": "EStatsCount", "m_eWeaponType": "ECitadelWeapon_Invalid", "m_strWeaponImage": "", "m_strWeaponNameLocString": "", "m_vecDisplayStats": [  ] }
	HeroStatsDisplay_t m_heroStatsDisplay;
	CitadelStatsDisplay_t m_ShopStatDisplay;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strDeathVOSound;
	CSoundEventName m_strDeathSound;
	CSoundEventName m_strLastHitSound;
	CSoundEventName m_strRosterSelectedSound;
	CSoundEventName m_strRosterRemovedSound;
	CSoundEventName m_strRosterAvoidedSound;
	CSoundEventName m_strHeroVotedSound;
	CSoundEventName m_strHeroDebutSound;
	CSoundEventName m_strCharacterRevealDialog;
	CSoundEventName m_strCharacterRevealSfxStart;
	CSoundEventName m_strCharacterRevealSfxStop;
	CSoundEventName m_strLowHealthSound;
	CSoundEventName m_strHeroSpecificLowHealthSound;
	CSoundEventName m_strMovementLoop;
	CSoundEventName m_strMovementLoopStart;
	CSoundEventName m_strMovementLoopStop;
	CSoundEventName m_strSlideLoop;
	CSoundEventName m_strPostGameVictorySound;
	CSoundEventName m_strPostGameDefeatSound;
	// MPropertyDescription = "Teammate footstep sounds are relative to whoever we're spectating."
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCVSoundEventScriptList > > m_hGameSoundEventScript;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCVSoundEventScriptList > > m_hGeneratedVOEventScript;
	float32 m_flStealthSpeedMetersPerSecond; // = 4
	// MPropertyStartGroup = ""
	EHeroDevelopmentState m_eHeroDevelopmentState; // = "EHeroDevState_InDevelopment"
	bool m_bInDevelopment;
	bool m_bNewPlayerRecommended;
	bool m_bLaneTestingRecommended;
	bool m_bNeedsTesting;
	bool m_bLimitedTesting;
	bool m_bDisabled;
	int32 m_nComplexity;
	// MPropertyDescription = "Minimum bot match difficulty for this hero to appear as an ally bot. -1 = never."
	// MPropertyAttributeRange = "-1 4"
	int32 m_nAllyBotDifficulty;
	// MPropertyDescription = "Minimum bot match difficulty for this hero to appear as an enemy bot. -1 = never."
	// MPropertyAttributeRange = "-1 4"
	int32 m_nEnemyBotDifficulty;
	// MPropertyStartGroup = "Low Health Settings"
	// MPropertyDescription = "Percentage of health to be considered low health"
	// MPropertyAttributeRange = "0 1"
	float32 m_flMinLowHealthPercentage; // = 0.1
	// MPropertyDescription = "Percentage of health to be considered low health when you have high max health."
	// MPropertyAttributeRange = "0 1"
	float32 m_flMaxLowHealthPercentage; // = 0.2
	// MPropertyDescription = "Percentage of health to be considered mid health"
	// MPropertyAttributeRange = "0 1"
	float32 m_flMinMidHealthPercentage; // = 0.4
	// MPropertyDescription = "Percentage of health to be considered mid health when you have high max health."
	// MPropertyAttributeRange = "0 1"
	float32 m_flMaxMidHealthPercentage; // = 0.5
	// MPropertyDescription = "Min Max Health for Remapped Value"
	float32 m_flMinHealthForThreshold; // = 1000
	// MPropertyDescription = "Max Max Health for remapped value"
	float32 m_flMaxHealthForThreshold; // = 2750
	// MPropertyDescription = "How long a player is deemed in combat taking or dealing damage to a player"
	float32 m_flInCombatWithHeroDuration; // = 3
	// MPropertyDescription = "How long a player is deemed in combat taking or dealing damage to a non-player"
	float32 m_flInCombatWithNonHeroDuration; // = 0.5
	// MPropertyDescription = "How long a player is deemed in combat taking or dealing damage to a neutral trooper"
	float32 m_flInCombatWithNeutralDuration; // = 3
	// MPropertyDescription = "Show N/A for falloff numbers in gun panel."
	bool m_bNAGunFalloffRange;
	// MPropertyDescription = "Can this hero make it into the tunnel areas without it being a bug."
	bool m_bAllowedInTunnels;
	// MPropertyStartGroup = ""
	CUtlOrderedMap< EStatsType, float32 > m_mapStartingStats;
	CUtlOrderedMap< EStatsType, HeroScalingStat_t > m_mapScalingStats;
	CPiecewiseCurve m_groundDashPositionCurve;
	CUtlOrderedMap< EItemSlotTypes_t, CUtlVector< ModCostBonuses_t > > m_mapModCostBonuses;
	CUtlOrderedMap< EItemSlotTypes_t, ItemSlotInfo_t > m_mapItemSlotInfo;
	EAbilityResourceType m_eAbilityResourceType; // = "EResourceType_None"
	CUtlString m_strGunTag;
	CUtlVector< CUtlString > m_vecHeroTags;
	EHeroType m_eHeroType; // = "ECitadelHeroType_LastEnum"
	CUtlString m_strRosterBackgroundLayout;
	// MPropertyDescription = "A custom rich presence string to show while in the hideout"
	CUtlString m_strHideoutRichPresence;
	// MPropertyMapKeyLeafChoiceProviderFn
	CUtlDict< float32 > m_mapItemDraftCounterWeights;
	CUtlOrderedMap< EModifierValue, float32 > m_mapStandardLevelUpUpgrades;
	ItemPopularity_t m_PopularItems;
	CUtlOrderedMap< int32, HeroLevel_t > m_mapLevelInfo;
	CUtlOrderedMap< EAbilitySlots_t, CSubclassName< 4 > > m_mapBoundAbilities;
	CUtlOrderedMap< EAbilitySlots_t, CSubclassName< 4 > > m_mapWIPAbilities;
	// MPropertyMapKeyLeafChoiceProviderFn
	CUtlOrderedMap< CUtlString, ItemDraftWeight_t > m_mapItemDraftBucketing;
};
