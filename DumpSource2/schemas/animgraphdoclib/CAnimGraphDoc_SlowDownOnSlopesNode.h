// MGetKV3ClassDefaults = {
//	"_class": "CAnimGraphDoc_SlowDownOnSlopesNode",
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
//	"m_flSlowDownStrength": 1.000000
//}
// MPropertyFriendlyName = "Slow Down On Slopes"
// MHasKV3TransferPolymorphicClassname
class CAnimGraphDoc_SlowDownOnSlopesNode : public CAnimGraphDoc_Node
{
	// MPropertySuppressField
	CAnimGraphDoc_NodeConnection m_inputConnection;
	// MPropertyFriendlyName = "Slow Down Strength"
	// MPropertyAttributeRange = "0.1 2"
	float32 m_flSlowDownStrength;
};
