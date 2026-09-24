// MGetKV3ClassDefaults = {
//	"_class": "CAnimGraphDoc_ToggleComponentAction",
//	"m_componentID":
//	{
//		"m_id": 0
//	},
//	"m_bSetEnabled": true
//}
// MHasKV3TransferPolymorphicClassname
class CAnimGraphDoc_ToggleComponentAction : public CAnimGraphDoc_Action
{
	// MPropertyFriendlyName = "Component"
	// MPropertyAttributeChoiceName = "Component"
	AnimComponentID m_componentID;
	// MPropertyFriendlyName = "Set Enabled"
	bool m_bSetEnabled;
};
