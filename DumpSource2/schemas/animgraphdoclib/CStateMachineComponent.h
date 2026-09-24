// MGetKV3ClassDefaults = {
//	"_class": "CStateMachineComponent",
//	"m_group": "",
//	"m_id":
//	{
//		"m_id": 0
//	},
//	"m_bStartEnabled": true,
//	"m_nPriority": 100,
//	"m_networkMode": "ServerAuthoritative",
//	"m_states":
//	[
//	],
//	"m_sName": "Unnamed"
//}
// MHasKV3TransferPolymorphicClassname
class CStateMachineComponent : public CAnimGraphDoc_Component, public CAnimGraphDoc_StateMachine
{
	// MPropertyFriendlyName = "Name"
	// MPropertySortPriority = 100
	CUtlString m_sName;
};
