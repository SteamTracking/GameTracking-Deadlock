// MGetKV3ClassDefaults = {
//	"_class": "CAnimGraphDoc_RagdollNode",
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
//	"m_weightListName": "",
//	"m_poseControlMethod": "Absolute",
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
//	}
//}
// MPropertyFriendlyName = "Ragdoll"
// MHasKV3TransferPolymorphicClassname
class CAnimGraphDoc_RagdollNode : public CAnimGraphDoc_Node
{
	CUtlString m_weightListName;
	RagdollPoseControl m_poseControlMethod;
	// MPropertySuppressField
	CAnimGraphDoc_NodeConnection m_inputConnection;
};
