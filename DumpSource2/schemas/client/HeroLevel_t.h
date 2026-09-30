class HeroLevel_t
{
	// MPropertyFlattenIntoParentRow
	// MPropertyFlattenStretchFactor = 1
	// MPropertyFlattenIncludeLabel
	uint32 m_unRequiredGold;
	// MPropertyFlattenIntoParentRow
	// MPropertyFlattenStretchFactor = 1
	// MPropertyFlattenIncludeLabel
	bool m_bUseStandardUpgrade;
	CUtlOrderedMap< ECurrencyType, int32 > m_mapBonusCurrencies;
	CUtlVector< BonusUpgrade_t > m_vecBonusUpgrades;
};
