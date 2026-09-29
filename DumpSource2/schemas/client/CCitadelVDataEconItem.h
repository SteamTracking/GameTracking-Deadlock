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
//	"m_kvStaticAttributes": null,
//	"m_mapEquipSlots":
//	{
//	},
//	"m_vecEquipModifiers":
//	[
//	],
//	"m_mapVariantSlots":
//	{
//	},
//	"m_HideoutProp":
//	{
//		"m_nPropType": "HIDEOUT_PROP_TYPE_INVALID",
//		"m_ModelName": "",
//		"m_TextureName": "",
//		"m_ImageName": "",
//		"m_vecPropModifiers":
//		[
//		]
//	}
//}
class CCitadelVDataEconItem : public CVDataEconItem
{
	CUtlOrderedMap< HeroID_t, uint16 > m_mapEquipSlots;
	CUtlVector< CEmbeddedSubclass< CCitadel_Modifier_Econ > > m_vecEquipModifiers;
	CUtlOrderedMap< CUtlString, CVariantItemSlotDefinition > m_mapVariantSlots;
	CHideoutPropDefinition m_HideoutProp;
};
