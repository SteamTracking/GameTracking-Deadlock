// MGetKV3ClassDefaults = {
//	"_class": "CNmTargetPointNode::CDefinition",
//	"m_nNodeIdx": -1,
//	"m_nInputValueNodeIdx": -1,
//	"m_bIsWorldSpaceTarget": true
//}
// MHasKV3TransferPolymorphicClassname
class CNmTargetPointNode::CDefinition : public CNmVectorValueNode::CDefinition
{
	int16 m_nInputValueNodeIdx;
	bool m_bIsWorldSpaceTarget;
};
