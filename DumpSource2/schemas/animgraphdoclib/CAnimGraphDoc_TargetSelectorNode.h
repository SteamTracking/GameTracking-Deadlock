// MGetKV3ClassDefaults = {
//	"_class": "CAnimGraphDoc_TargetSelectorNode",
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
//	"m_children":
//	[
//	],
//	"m_eLinearRootMotionMode": "TargetWarpLinearRootMotionMode_Default",
//	"m_eAngleMode": "eFacingHeading",
//	"m_moveHeadingParamID":
//	{
//		"m_id": 0
//	},
//	"m_desiredMoveHeadingParamID":
//	{
//		"m_id": 0
//	},
//	"m_targetPositionParamID":
//	{
//		"m_id": 0
//	},
//	"m_bTargetPositionIsWorldSpace": false,
//	"m_targetFacePositionParamID":
//	{
//		"m_id": 0
//	},
//	"m_bTargetFacePositionIsWorldSpace": false,
//	"m_bEnablePhaseMatching": false,
//	"m_flPhaseMatchingMaxRootMotionSkip": 0.400000
//}
// MPropertyFriendlyName = "Target Selector"
// MHasKV3TransferPolymorphicClassname
class CAnimGraphDoc_TargetSelectorNode : public CAnimGraphDoc_Node
{
	CUtlVector< CTargetSelectorChild > m_children;
	// MPropertyFriendlyName = "Linear Root Motion Mode"
	// MPropertyAutoRebuildOnChange
	TargetWarpLinearRootMotionMode m_eLinearRootMotionMode;
	// MPropertyFriendlyName = "Angle Mode"
	TargetSelectorAngleMode_t m_eAngleMode;
	// MPropertyFriendlyName = "Move Heading"
	// MPropertyAttributeChoiceName = "FloatParameter"
	AnimParamID m_moveHeadingParamID;
	// MPropertyFriendlyName = "Desired Move Heading"
	// MPropertyAttributeChoiceName = "FloatParameter"
	AnimParamID m_desiredMoveHeadingParamID;
	// MPropertyFriendlyName = "Target Position"
	// MPropertyAttributeChoiceName = "VectorParameter"
	// MPropertyAttrStateCallback
	AnimParamID m_targetPositionParamID;
	// MPropertyFriendlyName = "Target Position Is World Space"
	// MPropertyAttrStateCallback
	bool m_bTargetPositionIsWorldSpace;
	// MPropertyFriendlyName = "Target Face Position"
	// MPropertyAttributeChoiceName = "VectorParameter"
	AnimParamID m_targetFacePositionParamID;
	// MPropertyFriendlyName = "Target Face Position Is World Space"
	bool m_bTargetFacePositionIsWorldSpace;
	bool m_bEnablePhaseMatching;
	float32 m_flPhaseMatchingMaxRootMotionSkip;
};
