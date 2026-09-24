// MGetKV3ClassDefaults = {
//	"_class": "CAnimGraphDoc_FollowAttachmentNode",
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
//	"m_boneName": "",
//	"m_attachmentName": "",
//	"m_bMatchTranslation": false,
//	"m_bMatchRotation": false
//}
// MPropertyFriendlyName = "Follow Attachment"
// MHasKV3TransferPolymorphicClassname
class CAnimGraphDoc_FollowAttachmentNode : public CAnimGraphDoc_Node
{
	// MPropertySuppressField
	CAnimGraphDoc_NodeConnection m_inputConnection;
	// MPropertyFriendlyName = "Bone"
	// MPropertyAttributeChoiceName = "Bone"
	CUtlString m_boneName;
	// MPropertyFriendlyName = "Target Attachment"
	// MPropertyAttributeChoiceName = "Attachment"
	CUtlString m_attachmentName;
	// MPropertyFriendlyName = "Match Translation"
	bool m_bMatchTranslation;
	// MPropertyFriendlyName = "Match Rotation"
	bool m_bMatchRotation;
};
