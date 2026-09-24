// MGetKV3ClassDefaults = {
//	"_class": "CAnimGraphDoc_FootCycleMetric",
//	"m_flWeight": 1.000000,
//	"m_feet":
//	[
//	]
//}
// MPropertyFriendlyName = "Foot Cycle Metric"
// MHasKV3TransferPolymorphicClassname
class CAnimGraphDoc_FootCycleMetric : public CAnimGraphDoc_MotionMetric
{
	// MPropertyFriendlyName = "Foot"
	// MPropertyAttributeChoiceName = "Foot"
	// MPropertyAutoExpandSelf
	CUtlVector< CUtlString > m_feet;
};
