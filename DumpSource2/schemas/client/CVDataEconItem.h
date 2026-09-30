class CVDataEconItem
{
	item_definition_index_t m_nDefIndex;
	item_definition_index_t m_nAssociatedItemDefIndex;
	item_steam_cache_version_t m_unSteamCacheVersion;
	uint8 m_nItemRarity; // = 255
	uint8 m_nItemQuality; // = 255
	uint8 m_nForcedItemQuality; // = 255
	uint8 m_nDefaultDropQuantity; // = 1
	CUtlString m_strItemBaseName;
	CUtlString m_strItemTypeName;
	CUtlString m_strItemDesc;
	uint32 m_rtExpiration;
	item_definition_index_t m_unOnExpirationTransmuteToItem;
	uint32 m_rtDefCreation;
	CUtlString m_strEventID;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_strInventoryModel;
	CPanoramaImageName m_strInventoryImage;
	CPanoramaImageName m_strInventoryOverlayImage;
	CUtlVector< CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > > m_vecBaseDisplayModels;
	CUtlString m_strItemClassname;
	bitfield:1 m_bHidden;
	bitfield:1 m_bHideInStore;
	bitfield:1 m_bHideInInventory;
	bitfield:1 m_bHideInPurchasePopup;
	bitfield:1 m_bBaseItem;
	bitfield:1 m_bHasStoreCustomItemDetailsPanel;
	bitfield:1 m_bRemovePriceBlockFromStore;
	bitfield:1 m_bShouldHideTradeCraftDelete;
	bitfield:1 m_bAlwaysSendToServers;
	bitfield:1 m_bPreventGifting;
	bitfield:1 m_bHideQuantity;
	bitfield:1 m_bShowItemAssetLootList;
	bitfield:1 m_bPublicItem;
	bitfield:1 m_bOverrideAttackAttachments;
	bitfield:1 m_bFlipViewModel;
	uint8 m_unPurchaseLimitedQuantity;
	KeyValues3 m_kvDynamicAttributes;
	KeyValues3 m_kvStaticAttributes;
};
