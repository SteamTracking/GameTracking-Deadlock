class GameModeStreetBrawl_t
{
	CUtlVector< float32 > m_vecRespawnTimes;
	CUtlVector< float32 > m_flOvertimeRespawnTimeIncrease;
	CUtlVector< float32 > m_flOvertimeRespawnTimeIncreaseUrgent;
	CUtlVector< float32 > m_flOvertimeTrooperHealthScale;
	CUtlVector< float32 > m_flOvertimeTrooperDamageScale;
	CUtlVector< float32 > m_vecPreBuyTime;
	CUtlVector< float32 > m_vecBuyTime;
	CUtlVector< int32 > m_vecGoldPerRound;
	CUtlVector< int32 > m_vecAPPerRound;
	CUtlVector< int32 > m_vecObjectiveMaxHealth;
	CUtlVector< int32 > m_vecItemDraftRerollsPerRound;
	CUtlVector< float32 > m_vecRoundLengthMinutes;
	CUtlVector< float32 > m_vecRoundLengthMinutesUrgent;
	CUtlVector< float32 > m_flTrooperSpawnTimer;
	CUtlVector< StreetBrawlGameRoundDrafts_t > m_vecItemDraftRoundsPerGameRound;
	CUtlOrderedMap< EModTier_t, ItemDraftBucketing_t > m_mapItemTierToItemDraftBuckets;
	float32 m_nMatchLengthMinutes; // = 18
	int32 m_nTier2BonusHealth; // = 4000
	int32 m_nComebackBonusHealth; // = 1000
	int32 m_nComebackBonusHealthCritical; // = 4000
	float32 m_flTrooperNonOvertimeResist; // = 20
	float32 m_flTrooperOvertimeResist; // = 20
	// MPropertyDescription = "When we own 3 actives, scale the weight of actives by this much"
	float32 m_flActivesReductionWeightScale; // = 0.35
	// MPropertyDescription = "If you've got more legendaries than everyone else, we'll not even consider you for another this % of the time"
	float32 m_flLegendaryOwnerSkipChancePct; // = 95
	// MPropertyDescription = "If you've got more enhanced than everyone else, we'll not even consider you for another this % of the time"
	float32 m_flEnhancedOwnerSkipChancePct; // = 75
	// MPropertyDescription = "When rolling a rare item scale up the "Good" bucket's weight by this much"
	float32 m_flRareWeightScale; // = 2
	// MPropertyDescription = "When a players' team is in comeback state, apply this weighting scale to their "Good" bucket of items"
	float32 m_flComebackWeightScale_Trailing_2; // = 8
	// MPropertyDescription = "When a players' team is in comeback state, apply this weighting scale to their "Good" bucket of items"
	float32 m_flComebackWeightScale_Trailing_1; // = 2
	CSubclassName< 0 > m_strAmberTrooperPickupToDrop;
	CSubclassName< 0 > m_strSapphireTrooperPickupToDrop;
	CSubclassName< 2 > m_strTrooperModifier;
	float32 m_flScoringTime; // = 5
	float32 m_flPreScoringTime; // = 1
	float32 m_flScoringGameTimeScale; // = 0.5
	int32 m_iScoreToWin; // = 3
	int32 m_iLaneNumber; // = 4
	float32 m_flTrooperSpawnBeforeRoundStartTimer; // = 5
	float32 m_flZipBoostCooldownOnStart; // = 20
	float32 m_flBuyTimeGracePeriod; // = 15
	int32 m_iUltimateUnlockRound;
	// MPropertyDescription = "Round whose buy phase lets every player corrupt one non-enhanced item.  1 = first round, 0 = never."
	int32 m_iCorruptItemRound;
	float32 m_flTier1MaxResistTime; // = 4
	float32 m_flTier2MaxResistTime; // = 4
};
