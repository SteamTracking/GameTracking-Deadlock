// MGetKV3ClassDefaults = {
//	"_class": "CAnimGraphDoc_FutureVelocityMetric",
//	"m_flWeight": 1.000000,
//	"m_flDistance": 100.000000,
//	"m_flStoppingDistance": 100.000000,
//	"m_eMode": "DirectionAndMagnitude",
//	"m_bAutoTargetSpeed": true,
//	"m_flManualTargetSpeed": 150.000000
//}
// MPropertyFriendlyName = "Future Velocity Metric"
// MHasKV3TransferPolymorphicClassname
class CAnimGraphDoc_FutureVelocityMetric : public CAnimGraphDoc_MotionMetric
{
	// MPropertyFriendlyName = "Distance"
	float32 m_flDistance;
	// MPropertyFriendlyName = "Stopping Distance"
	float32 m_flStoppingDistance;
	// MPropertyFriendlyName = "Mode"
	// MPropertyAutoRebuildOnChange
	VelocityMetricMode m_eMode;
	// MPropertyFriendlyName = "Auto-Calculate target speed"
	// MPropertyAutoRebuildOnChange
	// MPropertyAttrStateCallback
	bool m_bAutoTargetSpeed;
	// MPropertyFriendlyName = "Target Speed"
	// MPropertyAttrStateCallback
	float32 m_flManualTargetSpeed;
};
