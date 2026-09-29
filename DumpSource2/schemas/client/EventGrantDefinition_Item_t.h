// MGetKV3ClassDefaults = {
//	"_class": "EventGrantDefinition_Item_t",
//	"m_unItemDef": 0,
//	"m_eOrigin": "kEconItemOrigin_Invalid",
//	"m_eQuality": "AE_UNDEFINED",
//	"m_eAckPos": "UNACK_ITEM_UNKNOWN",
//	"m_unQuantity": 1,
//	"m_bDisableTrade": false,
//	"m_bOnlyGrantIfNotOwned": false,
//	"m_strRewardDescription": ""
//}
// MHasKV3TransferPolymorphicClassname
class EventGrantDefinition_Item_t : public EventGrantDefinition_t
{
	item_definition_index_t m_unItemDef;
	eEconItemOrigin m_eOrigin;
	EEconItemQuality m_eQuality;
	unacknowledged_item_inventory_positions_t m_eAckPos;
	uint32 m_unQuantity;
	bool m_bDisableTrade;
	bool m_bOnlyGrantIfNotOwned;
	CUtlString m_strRewardDescription;
};
