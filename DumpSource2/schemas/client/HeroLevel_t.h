// MGetKV3ClassDefaults = {
//	"m_unRequiredGold": 0,
//	"m_bUseStandardUpgrade": false,
//	"m_mapBonusCurrencies":
//	{
//	},
//	"m_vecBonusUpgrades":
//	[
//	]
//}
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
