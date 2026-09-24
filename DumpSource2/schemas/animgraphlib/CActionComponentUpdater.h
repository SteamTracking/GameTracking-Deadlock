// MGetKV3ClassDefaults = {
//	"_class": "CActionComponentUpdater",
//	"m_name": "",
//	"m_id":
//	{
//		"m_id": 0
//	},
//	"m_networkMode": "ServerAuthoritative",
//	"m_bStartEnabled": false,
//	"m_actions":
//	[
//	]
//}
// MHasKV3TransferPolymorphicClassname
class CActionComponentUpdater : public CAnimComponentUpdater
{
	CUtlVector< CSmartPtr< CAnimActionUpdater > > m_actions;
};
