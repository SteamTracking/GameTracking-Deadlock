class CCitadel_Pickup_Ability : public CCitadel_Pickup
{
	AbilityUpgradeBits_t m_nUpgradeBits;
	int32 m_nUpgradeLevel;
	CUtlStringToken m_unAbilityID;
	int32 m_nGoldCost;
	bool m_bShowGoldCostInUI;
};
