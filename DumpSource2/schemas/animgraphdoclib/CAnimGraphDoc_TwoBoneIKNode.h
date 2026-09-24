// MGetKV3ClassDefaults = {
//	"_class": "CAnimGraphDoc_TwoBoneIKNode",
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
//	"m_ikChainName": "",
//	"m_bAutoDetectHingeAxis": true,
//	"m_endEffectorType": "IkEndEffector_Bone",
//	"m_endEffectorAttachmentName": "",
//	"m_targetType": "IkTarget_Attachment",
//	"m_attachmentName": "",
//	"m_targetBoneName": "",
//	"m_targetParamName": "",
//	"m_targetParam":
//	{
//		"m_id": 0
//	},
//	"m_bMatchTargetOrientation": false,
//	"m_rotationParamName": "",
//	"m_rotationParam":
//	{
//		"m_id": 0
//	},
//	"m_bConstrainTwist": false,
//	"m_flMaxTwist": 15.000000
//}
// MPropertyFriendlyName = "Two-Bone IK"
// MHasKV3TransferPolymorphicClassname
class CAnimGraphDoc_TwoBoneIKNode : public CAnimGraphDoc_Node
{
	// MPropertySuppressField
	CAnimGraphDoc_NodeConnection m_inputConnection;
	// MPropertyFriendlyName = "IK Chain"
	// MPropertyAttributeChoiceName = "IKChain"
	CUtlString m_ikChainName;
	// MPropertyFriendlyName = "Auto-Detect Hinge Axis"
	bool m_bAutoDetectHingeAxis;
	// MPropertyGroupName = "End Effector"
	// MPropertyFriendlyName = "End Effector Type"
	// MPropertyAutoRebuildOnChange
	IkEndEffectorType m_endEffectorType;
	// MPropertyGroupName = "End Effector"
	// MPropertyFriendlyName = "Attachment"
	// MPropertyAttributeChoiceName = "Attachment"
	// MPropertyAttrStateCallback
	CUtlString m_endEffectorAttachmentName;
	// MPropertyGroupName = "Target"
	// MPropertyFriendlyName = "Target Type"
	// MPropertyAutoRebuildOnChange
	IkTargetType m_targetType;
	// MPropertyGroupName = "Target"
	// MPropertyFriendlyName = "Attachment"
	// MPropertyAttributeChoiceName = "Attachment"
	// MPropertyAttrStateCallback
	CUtlString m_attachmentName;
	// MPropertyGroupName = "Target"
	// MPropertyFriendlyName = "Bone"
	// MPropertyAttributeChoiceName = "Bone"
	// MPropertyAttrStateCallback
	CUtlString m_targetBoneName;
	// MPropertySuppressField
	CUtlString m_targetParamName;
	// MPropertyGroupName = "Target"
	// MPropertyFriendlyName = "Position Parameter"
	// MPropertyAttributeChoiceName = "VectorParameter"
	// MPropertyAttrStateCallback
	AnimParamID m_targetParam;
	// MPropertyGroupName = "Target"
	// MPropertyFriendlyName = "Match Target Orientation"
	// MPropertyAutoRebuildOnChange
	bool m_bMatchTargetOrientation;
	// MPropertySuppressField
	CUtlString m_rotationParamName;
	// MPropertyGroupName = "Target"
	// MPropertyFriendlyName = "Rotation Parameter"
	// MPropertyAttributeChoiceName = "QuaternionParameter"
	// MPropertyAttrStateCallback
	AnimParamID m_rotationParam;
	// MPropertyGroupName = "Target"
	// MPropertyFriendlyName = "Constrain Twist"
	// MPropertyAttrStateCallback
	bool m_bConstrainTwist;
	// MPropertyGroupName = "Target"
	// MPropertyFriendlyName = "Max Twist"
	// MPropertyAttrStateCallback
	float32 m_flMaxTwist;
};
