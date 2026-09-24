// MGetKV3ClassDefaults = {
//	"_class": "CActionComponent",
//	"m_group": "",
//	"m_id":
//	{
//		"m_id": 0
//	},
//	"m_bStartEnabled": true,
//	"m_nPriority": 100,
//	"m_networkMode": "ServerAuthoritative",
//	"m_actions":
//	[
//	],
//	"m_sName": "Action Component"
//}
// MHasKV3TransferPolymorphicClassname
class CActionComponent : public CAnimGraphDoc_Component
{
	CUtlVector< CSmartPtr< CAnimGraphDoc_Action > > m_actions;
	// MPropertyFriendlyName = "Name"
	// MPropertySortPriority = 100
	CUtlString m_sName;
};
