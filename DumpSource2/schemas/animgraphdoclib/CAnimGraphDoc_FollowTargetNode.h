// MGetKV3ClassDefaults = {
//	"_class": "CAnimGraphDoc_FollowTargetNode",
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
//	"m_TargetSettings":
//	{
//		"m_TargetSource": "Bone",
//		"m_Bone":
//		{
//			"m_Name": ""
//		},
//		"m_AnimgraphParameterNamePosition":
//		{
//			"m_id": 0
//		},
//		"m_AnimgraphParameterNameOrientation":
//		{
//			"m_id": 0
//		},
//		"m_TargetCoordSystem": "World Space"
//	},
//	"m_bMatchTargetOrientation": false
//}
// MPropertyFriendlyName = "Follow Target"
// MHasKV3TransferPolymorphicClassname
class CAnimGraphDoc_FollowTargetNode : public CAnimGraphDoc_Node
{
	// MPropertySuppressField
	CAnimGraphDoc_NodeConnection m_inputConnection;
	// MPropertyFriendlyName = "Bone"
	// MPropertyAttributeChoiceName = "Bone"
	CUtlString m_boneName;
	// MPropertyFriendlyName = "Target Settings"
	// MPropertyAutoExpandSelf
	IKTargetSettings_t m_TargetSettings;
	// MPropertyFriendlyName = "Match Target Orientation"
	// MPropertyAutoRebuildOnChange
	bool m_bMatchTargetOrientation;
};
