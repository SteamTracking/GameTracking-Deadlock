// MGetKV3ClassDefaults = {
//	"_class": "CCPPScriptComponentUpdater",
//	"m_name": "",
//	"m_id":
//	{
//		"m_id": 0
//	},
//	"m_networkMode": "ServerAuthoritative",
//	"m_bStartEnabled": false,
//	"m_scriptsToRun":
//	[
//	]
//}
// MHasKV3TransferPolymorphicClassname
class CCPPScriptComponentUpdater : public CAnimComponentUpdater
{
	// MPropertyFriendlyName = "Scripts"
	CUtlVector< CGlobalSymbol > m_scriptsToRun;
};
