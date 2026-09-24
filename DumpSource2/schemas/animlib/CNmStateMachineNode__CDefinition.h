// MGetKV3ClassDefaults = {
//	"_class": "CNmStateMachineNode::CDefinition",
//	"m_nNodeIdx": -1,
//	"m_stateDefinitions":
//	[
//	],
//	"m_nDefaultStateIndex": -1
//}
// MHasKV3TransferPolymorphicClassname
class CNmStateMachineNode::CDefinition : public CNmPoseNode::CDefinition
{
	CUtlLeanVectorFixedGrowable< CNmStateMachineNode::StateDefinition_t, 5 > m_stateDefinitions;
	int16 m_nDefaultStateIndex;
};
