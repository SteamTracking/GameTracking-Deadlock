// MGetKV3ClassDefaults = {
//	"_class": "CRemapValueComponent",
//	"m_group": "",
//	"m_id":
//	{
//		"m_id": 0
//	},
//	"m_bStartEnabled": true,
//	"m_nPriority": 100,
//	"m_networkMode": "ServerAuthoritative",
//	"m_name": "",
//	"m_items":
//	[
//	]
//}
// MHasKV3TransferPolymorphicClassname
class CRemapValueComponent : public CAnimGraphDoc_Component
{
	// MPropertyFriendlyName = "Name"
	CUtlString m_name;
	// MPropertyFriendlyName = "Items"
	// MPropertyAutoExpandSelf
	CUtlVector< CRemapValueItem > m_items;
};
