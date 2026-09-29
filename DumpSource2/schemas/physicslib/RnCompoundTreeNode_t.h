// MGetKV3ClassDefaults = {
//	"m_vMin":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_vMax":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_nType": 0,
//	"m_nSubtreeEndOrCompoundId": 0
//}
class RnCompoundTreeNode_t
{
	Vector m_vMin;
	Vector m_vMax;
	bitfield:3 m_nType;
	bitfield:29 m_nSubtreeEndOrCompoundId;
};
