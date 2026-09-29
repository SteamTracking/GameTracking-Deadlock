// MGetKV3ClassDefaults = {
//	"_class": "CnmGraphDocChainLookatNode::CData",
//	"m_endEffectorBoneName": "",
//	"m_endEffectorForwardAxis":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_endEffectorOffset":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_nChainLength": 2,
//	"m_flBlendTimeSeconds": 0.000000,
//	"m_chainWeights":
//	[
//	]
//}
// MHasKV3TransferPolymorphicClassname
class CnmGraphDocChainLookatNode::CData : public CNmGraphDocVariationDataNode::CData
{
	CUtlString m_endEffectorBoneName;
	// MPropertyDescription = "The axis that you want to point at the target"
	Vector m_endEffectorForwardAxis;
	// MPropertyDescription = "Add an additional local space offset to the end effector to use for aiming the lookat"
	Vector m_endEffectorOffset;
	// MPropertyDescription = "The length of the IK chain"
	// MPropertyAttributeRange = "2 7"
	uint8 m_nChainLength;
	// MPropertyDescription = "How long should the blend in/out take"
	float32 m_flBlendTimeSeconds;
	// MPropertyAutoExpandSelf
	// MPropertyDescription = "The weights from the tip of the chain to the base. 0 is the effector/tip of the chain weight, N is the base of the chain."
	CUtlVector< float32 > m_chainWeights;
};
