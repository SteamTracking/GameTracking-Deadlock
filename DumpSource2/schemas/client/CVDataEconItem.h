// MGetKV3ClassDefaults = {
//	"m_nDefIndex": 0,
//	"m_nAssociatedItemDefIndex": 0,
//	"m_unSteamCacheVersion": 0,
//	"m_nItemRarity": 255,
//	"m_nItemQuality": 255,
//	"m_nForcedItemQuality": 255,
//	"m_nDefaultDropQuantity": 1,
//	"m_strItemBaseName": "",
//	"m_strItemTypeName": "",
//	"m_strItemDesc": "",
//	"m_rtExpiration": 0,
//	"m_unOnExpirationTransmuteToItem": 0,
//	"m_rtDefCreation": 0,
//	"m_strEventID": "",
//	"m_strInventoryModel": "",
//	"m_strInventoryImage": "",
//	"m_strInventoryOverlayImage": "",
//	"m_vecBaseDisplayModels":
//	[
//	],
//	"m_strItemClassname": "",
//	"m_bHidden": false,
//	"m_bHideInStore": false,
//	"m_bHideInInventory": false,
//	"m_bHideInPurchasePopup": false,
//	"m_bBaseItem": false,
//	"m_bHasStoreCustomItemDetailsPanel": false,
//	"m_bRemovePriceBlockFromStore": false,
//	"m_bShouldHideTradeCraftDelete": false,
//	"m_bAlwaysSendToServers": false,
//	"m_bPreventGifting": false,
//	"m_bHideQuantity": false,
//	"m_bShowItemAssetLootList": false,
//	"m_bPublicItem": false,
//	"m_bOverrideAttackAttachments": false,
//	"m_bFlipViewModel": false,
//	"m_unPurchaseLimitedQuantity": 0,
//	"m_kvDynamicAttributes": null,
//	"m_kvStaticAttributes": null
//}
class CVDataEconItem
{
	item_definition_index_t m_nDefIndex;
	item_definition_index_t m_nAssociatedItemDefIndex;
	item_steam_cache_version_t m_unSteamCacheVersion;
	uint8 m_nItemRarity;
	uint8 m_nItemQuality;
	uint8 m_nForcedItemQuality;
	uint8 m_nDefaultDropQuantity;
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
