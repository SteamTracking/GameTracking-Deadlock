// MGetKV3ClassDefaults = {
//	"_class": "CAnimGraphDoc_CycleControlNode",
//	"m_sName": "Unnamed",
//	"m_vecPosition":
//	[
//		0.000000,
//		0.000000
//	],
//	"m_nNodeID":
//	{
//		"m_id": 0
//	},
//	"m_bDebugThisNode": false,
//	"m_networkMode": "ServerAuthoritative",
//	"m_inputConnection":
//	{
//		"m_nodeID":
//		{
//			"m_id": 0
//		},
//		"m_outputID":
//		{
//			"m_id": 0
//		}
//	},
//	"m_valueSource": "Parameter",
//	"m_paramName": "",
//	"m_param":
//	{
//		"m_id": 0
//	},
//	"m_bLockWhenWaning": false
//}
// MPropertyFriendlyName = "Cycle Control"
// MHasKV3TransferPolymorphicClassname
class CAnimGraphDoc_CycleControlNode : public CAnimGraphDoc_Node
{
	// MPropertySuppressField
	CAnimGraphDoc_NodeConnection m_inputConnection;
	// MPropertyFriendlyName = "Blend Source"
	// MPropertyAutoRebuildOnChange
	// MPropertyAttrStateCallback
	AnimValueSource m_valueSource;
	// MPropertySuppressField
	CUtlString m_paramName;
	// MPropertyFriendlyName = "Parameter"
	// MPropertyAttributeChoiceName = "FloatParameter"
	AnimParamID m_param;
	// MPropertyFriendlyName = "Lock When Waning"
	bool m_bLockWhenWaning;
};
