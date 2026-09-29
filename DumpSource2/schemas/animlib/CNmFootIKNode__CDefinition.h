// MGetKV3ClassDefaults = {
//	"_class": "CNmFootIKNode::CDefinition",
//	"m_nNodeIdx": -1,
//	"m_nChildNodeIdx": -1,
//	"m_leftEffectorBoneID": "",
//	"m_rightEffectorBoneID": "",
//	"m_nLeftTargetNodeIdx": -1,
//	"m_nRightTargetNodeIdx": -1,
//	"m_nEnabledNodeIdx": -1,
//	"m_flBlendTimeSeconds": 0.000000,
//	"m_blendMode": "Effector",
//	"m_bIsTargetInWorldSpace": false
//}
// MHasKV3TransferPolymorphicClassname
class CNmFootIKNode::CDefinition : public CNmPassthroughNode::CDefinition
{
	CGlobalSymbol m_leftEffectorBoneID;
	CGlobalSymbol m_rightEffectorBoneID;
	int16 m_nLeftTargetNodeIdx;
	int16 m_nRightTargetNodeIdx;
	int16 m_nEnabledNodeIdx;
	float32 m_flBlendTimeSeconds;
	NmIKBlendMode_t m_blendMode;
	bool m_bIsTargetInWorldSpace;
};
