class C_Citadel_Pickup_Ability : public C_Citadel_Pickup
{
	AbilityUpgradeBits_t m_nUpgradeBits;
	int32 m_nUpgradeLevel;
	CUtlStringToken m_unAbilityID;
	int32 m_nGoldCost;
	bool m_bShowGoldCostInUI;
};
