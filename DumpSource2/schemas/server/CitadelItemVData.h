// MHasKV3TransferPolymorphicClassname
class CitadelItemVData : public CitadelAbilityVData
{
	EModTier_t m_iItemTier; // = "EModTier_Invalid"
	int32 m_nShopPriceOverride; // = -1
	bool m_bWarnIfNoAffectedAbilities;
	bool m_bShowTextDescription; // = true
	EShopFilters_t m_eDisableShopFilters;
	EShopFilters_t m_eAdditionalShopFilters;
	EShopFilters_t m_eGeneratedShopFilters;
	EAbilityRequirements_t m_eAbilityRequirements;
	CPanoramaImageName m_strShopIconLarge;
	CUtlString m_strLocSearchString;
	// MPropertyFriendlyName = "Shop Data"
	int32 m_nShopVersion;
	CUtlString m_strDisableItemTarget;
	CUtlString m_strOverrideDisplayNameLocToken;
	// MPropertyFriendlyName = "Disabled for bots"
	bool m_bDisabledForBots;
	// MPropertyFriendlyName = "Allow Item Stacking"
	bool m_bAllowItemStacking; // = true
	// MPropertyFriendlyName = "Corrupted Item"
	CorruptedItemInfo_t m_CorruptedItemInfo; // = { "m_Upgrade": { "m_vecPropertyUpgrades": [  ] }, "m_nSoulCostOverride": -1, "m_vecExcludedPenalties": [  ], "m_vecIntrinsicModifiers": [  ] }
	CUtlVector< CSubclassName< 4 > > m_vecComponentItems;
	// MPropertyCustomFGDType = "vdata_choice:scripts/heroes.vdata"
	CUtlVector< CUtlString > m_vecDisabledOnHeroes;
};
