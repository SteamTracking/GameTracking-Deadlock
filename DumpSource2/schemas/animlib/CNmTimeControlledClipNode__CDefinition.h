// MGetKV3ClassDefaults = {
//	"_class": "CNmTimeControlledClipNode::CDefinition",
//	"m_nNodeIdx": -1,
//	"m_nPlayInReverseValueNodeIdx": -1,
//	"m_bSampleRootMotion": true,
//	"m_nDataSlotIdx": -1,
//	"m_nTimeValueNodeIdx": -1,
//	"m_graphEvents":
//	[
//	]
//}
// MHasKV3TransferPolymorphicClassname
class CNmTimeControlledClipNode::CDefinition : public CNmPoseNode::CDefinition
{
	int16 m_nPlayInReverseValueNodeIdx;
	bool m_bSampleRootMotion;
	int16 m_nDataSlotIdx;
	int16 m_nTimeValueNodeIdx;
	CUtlVectorFixedGrowable< CGlobalSymbol, 2 > m_graphEvents;
};
