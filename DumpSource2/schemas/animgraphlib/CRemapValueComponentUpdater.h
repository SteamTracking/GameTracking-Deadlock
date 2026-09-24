// MGetKV3ClassDefaults = {
//	"_class": "CRemapValueComponentUpdater",
//	"m_name": "",
//	"m_id":
//	{
//		"m_id": 0
//	},
//	"m_networkMode": "ServerAuthoritative",
//	"m_bStartEnabled": false,
//	"m_items":
//	[
//	]
//}
// MHasKV3TransferPolymorphicClassname
class CRemapValueComponentUpdater : public CAnimComponentUpdater
{
	CUtlVector< CRemapValueUpdateItem > m_items;
};
