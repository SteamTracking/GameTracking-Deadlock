// MGetKV3ClassDefaults = {
//	"_class": "CAnimGraphDoc_OrientationWarpNode",
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
//	"m_eMode": "eAngle",
//	"m_targetParamID":
//	{
//		"m_id": 0
//	},
//	"m_targetPositionParamID":
//	{
//		"m_id": 0
//	},
//	"m_fallbackTargetPositionParamID":
//	{
//		"m_id": 0
//	},
//	"m_eTargetOffsetMode": "eLiteralValue",
//	"m_flTargetOffset": 0.000000,
//	"m_targetOffsetParamID":
//	{
//		"m_id": 0
//	},
//	"m_flMaxRootMotionScale": 10.000000,
//	"m_eRootMotionSource": "eAnimationOrProcedural",
//	"m_damping":
//	{
//		"_class": "CAnimInputDamping",
//		"m_speedFunction": "NoDamping",
//		"m_fSpeedScale": 1.000000,
//		"m_fFallingSpeedScale": 1.000000
//	},
//	"m_bEnablePreferredRotationDirection": false,
//	"m_ePreferredRotationDirection": "FacingHeading",
//	"m_flPreferredRotationThreshold": 190.000000
//}
// MPropertyFriendlyName = "Orientation Warp"
// MHasKV3TransferPolymorphicClassname
class CAnimGraphDoc_OrientationWarpNode : public CAnimGraphDoc_Node
{
	// MPropertySuppressField
	CAnimGraphDoc_NodeConnection m_inputConnection;
	// MPropertyFriendlyName = "Orient To"
	// MPropertyAutoRebuildOnChange
	OrientationWarpMode_t m_eMode;
	// MPropertyFriendlyName = "Angle Parameter"
	// MPropertyAttributeChoiceName = "FloatParameter"
	// MPropertyAttrStateCallback
	AnimParamID m_targetParamID;
	// MPropertyFriendlyName = "World Position"
	// MPropertyAttributeChoiceName = "VectorParameter"
	// MPropertyAttrStateCallback
	AnimParamID m_targetPositionParamID;
	// MPropertyFriendlyName = "Fallback World Position"
	// MPropertyAttributeChoiceName = "VectorParameter"
	// MPropertyAttrStateCallback
	AnimParamID m_fallbackTargetPositionParamID;
	// MPropertyFriendlyName = "Offset Mode"
	// MPropertyAutoRebuildOnChange
	OrientationWarpTargetOffsetMode_t m_eTargetOffsetMode;
	// MPropertyFriendlyName = "Offset"
	// MPropertyAttrStateCallback
	float32 m_flTargetOffset;
	// MPropertyFriendlyName = "Offset Parameter"
	// MPropertyAttrStateCallback
	// MPropertyAttributeChoiceName = "FloatParameter"
	AnimParamID m_targetOffsetParamID;
	// MPropertyFriendlyName = "Max Root Motion Scale"
	float32 m_flMaxRootMotionScale;
	// MPropertyFriendlyName = "Root Motion Source"
	OrientationWarpRootMotionSource_t m_eRootMotionSource;
	// MPropertyFriendlyName = "Damping"
	// MPropertyAttrStateCallback
	CAnimInputDamping m_damping;
	// MPropertyFriendlyName = "Enable Preferred Rotation Direction"
	// MPropertyAutoRebuildOnChange
	// MPropertyDescription = "Normally the orientation warp will take the shortest arc to align entity's forward vector with the target. With this option enabled it will rotate in the direction that includes passing through the preferred rotation direction parameter unless the resulting rotion is larger than the threshold specified."
	bool m_bEnablePreferredRotationDirection;
	// MPropertyFriendlyName = "Preferred Rotation Direction"
	// MPropertyAttrStateCallback
	// MPropertyDescription = "An angle relative to the entity's forward. ( Facing Heading, Look Heading ... )"
	AnimValueSource m_ePreferredRotationDirection;
	// MPropertyFriendlyName = "Preferred Rotation Threshold"
	// MPropertyAttrStateCallback
	// MPropertyDescription = "Orientation warp will never rotate angle larger than this even if it means not passing through the preferred rotation direction"
	float32 m_flPreferredRotationThreshold;
};
