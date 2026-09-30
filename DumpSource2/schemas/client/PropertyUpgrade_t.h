// MPropertyAutoExpandSelf
class PropertyUpgrade_t
{
	CUtlString m_strPropertyName;
	CUtlString m_strBonus;
	CUtlString m_strStreetBrawlBonus;
	EAbilityUpgradeType m_eUpgradeType; // = "EAddToBase"
	// MPropertyDescription = "If set, only applies the scaling of this upgrade to the specified stat"
	// MPropertySuppressExpr = "( m_eUpgradeType != EAddToScale && m_eUpgradeType != EMultiplyScale )"
	EStatsType m_eScaleStatFilter; // = "EStatsCount"
	// MPropertyDescription = "Corrupted upgrades only: when true this bonus is exempt from the per-match random variance and always applies exactly as authored"
	bool m_bFixedCorruptedBonus;
	// MPropertyDescription = "Corrupted upgrades only: when true the per-match random variance still applies but the result is rounded to the nearest integer"
	// MPropertySuppressExpr = "m_bFixedCorruptedBonus"
	bool m_bRoundCorruptedBonus;
};
