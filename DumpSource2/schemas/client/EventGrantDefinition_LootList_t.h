// MGetKV3ClassDefaults = {
//	"_class": "EventGrantDefinition_LootList_t",
//	"m_strLootList": "",
//	"m_eOrigin": "kEconItemOrigin_Invalid",
//	"m_eAckPos": "UNACK_ITEM_UNKNOWN",
//	"m_unQuantity": 1,
//	"m_bDisableTrade": false,
//	"m_strRewardName": "",
//	"m_strRewardDescription": "",
//	"m_strRewardFlavor": "",
//	"m_strImage": "",
//	"m_strScene": ""
//}
// MHasKV3TransferPolymorphicClassname
class EventGrantDefinition_LootList_t : public EventGrantDefinition_t
{
	CUtlString m_strLootList;
	eEconItemOrigin m_eOrigin;
	unacknowledged_item_inventory_positions_t m_eAckPos;
	uint32 m_unQuantity;
	bool m_bDisableTrade;
	CUtlString m_strRewardName;
	CUtlString m_strRewardDescription;
	CUtlString m_strRewardFlavor;
	CUtlString m_strImage;
	CUtlString m_strScene;
};
