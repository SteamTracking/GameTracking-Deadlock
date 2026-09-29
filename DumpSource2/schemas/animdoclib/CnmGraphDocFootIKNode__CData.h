// MGetKV3ClassDefaults = {
//	"_class": "CnmGraphDocFootIKNode::CData",
//	"m_leftEffectorBoneName": "",
//	"m_rightEffectorBoneName": "",
//	"m_flBlendTimeSeconds": 0.000000
//}
// MHasKV3TransferPolymorphicClassname
class CnmGraphDocFootIKNode::CData : public CNmGraphDocVariationDataNode::CData
{
	CUtlString m_leftEffectorBoneName;
	CUtlString m_rightEffectorBoneName;
	float32 m_flBlendTimeSeconds;
};
