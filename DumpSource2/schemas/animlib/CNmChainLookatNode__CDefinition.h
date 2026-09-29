// MGetKV3ClassDefaults = {
//	"_class": "CNmChainLookatNode::CDefinition",
//	"m_nNodeIdx": -1,
//	"m_nChildNodeIdx": -1,
//	"m_endEffectorBoneID": "",
//	"m_endEffectorForwardAxis":
//	[
//		1.000000,
//		0.000000,
//		0.000000
//	],
//	"m_endEffectorOffset":
//	[
//		1.000000,
//		0.000000,
//		0.000000
//	],
//	"m_nLookatTargetNodeIdx": -1,
//	"m_nEnabledNodeIdx": -1,
//	"m_flBlendTimeSeconds": 0.000000,
//	"m_chainWeights":
//	[
//	],
//	"m_nChainLength": 2,
//	"m_bIsTargetInWorldSpace": false
//}
// MHasKV3TransferPolymorphicClassname
class CNmChainLookatNode::CDefinition : public CNmPassthroughNode::CDefinition
{
	CGlobalSymbol m_endEffectorBoneID;
	Vector m_endEffectorForwardAxis;
	Vector m_endEffectorOffset;
	int16 m_nLookatTargetNodeIdx;
	int16 m_nEnabledNodeIdx;
	float32 m_flBlendTimeSeconds;
	CUtlVectorFixedGrowable< float32, 5 > m_chainWeights;
	uint8 m_nChainLength;
	bool m_bIsTargetInWorldSpace;
};
