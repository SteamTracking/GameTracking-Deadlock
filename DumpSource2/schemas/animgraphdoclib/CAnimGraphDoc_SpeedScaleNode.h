// MGetKV3ClassDefaults = {
//	"_class": "CAnimGraphDoc_SpeedScaleNode",
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
//	"m_paramName": "",
//	"m_param":
//	{
//		"m_id": 0
//	}
//}
// MPropertyFriendlyName = "Speed Scale"
// MHasKV3TransferPolymorphicClassname
class CAnimGraphDoc_SpeedScaleNode : public CAnimGraphDoc_Node
{
	// MPropertySuppressField
	CAnimGraphDoc_NodeConnection m_inputConnection;
	// MPropertySuppressField
	CUtlString m_paramName;
	// MPropertyFriendlyName = "Parameter"
	// MPropertyAttributeChoiceName = "FloatParameter"
	AnimParamID m_param;
};
