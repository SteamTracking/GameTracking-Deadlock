// MGetKV3ClassDefaults = {
//	"_class": "CCPPScriptComponent",
//	"m_group": "",
//	"m_id":
//	{
//		"m_id": 0
//	},
//	"m_bStartEnabled": true,
//	"m_nPriority": 100,
//	"m_networkMode": "ServerAuthoritative",
//	"m_scriptsToRun":
//	[
//	]
//}
// MHasKV3TransferPolymorphicClassname
class CCPPScriptComponent : public CAnimGraphDoc_Component
{
	// MPropertyFriendlyName = "Scripts"
	CUtlVector< CUtlString > m_scriptsToRun;
};
