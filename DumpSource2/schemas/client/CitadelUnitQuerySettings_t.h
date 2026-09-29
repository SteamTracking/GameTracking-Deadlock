// MModelGameData
// MGetKV3ClassDefaults = {
//	"m_eQueryVolumeMode": "k_eUnitQueryVolume_None",
//	"m_flMaxQueryRadius": 64.000000,
//	"m_flQueryRadius": 20.000000,
//	"m_flQueryHeight": 80.000000,
//	"m_flQueryZOffset": 0.000000
//}
// MPropertyFriendlyName = "Citadel Unit Query Settings"
// MFgdHelper = "citadelunitquerycapsule{}"
class CitadelUnitQuerySettings_t
{
	// MPropertyStartGroup = "Unit Query Volume"
	// MPropertyFriendlyName = "Query Volume Mode"
	// MPropertyDescription = "How the UnitQuerySystem's queries size this object's capsule"
	EUnitQueryVolumeMode m_eQueryVolumeMode;
	// MPropertySuppressExpr = "m_eQueryVolumeMode != k_eUnitQueryVolume_LimitRadius"
	// MPropertyFriendlyName = "Max Radius"
	// MPropertyDescription = "Upper bound on the physics-derived capsule radius. Height and position still come from the bounds."
	float32 m_flMaxQueryRadius;
	// MPropertySuppressExpr = "m_eQueryVolumeMode != k_eUnitQueryVolume_Override"
	// MPropertyFriendlyName = "Radius"
	float32 m_flQueryRadius;
	// MPropertySuppressExpr = "m_eQueryVolumeMode != k_eUnitQueryVolume_Override"
	// MPropertyFriendlyName = "Height"
	// MPropertyDescription = "Height of the model"
	float32 m_flQueryHeight;
	// MPropertySuppressExpr = "m_eQueryVolumeMode != k_eUnitQueryVolume_Override"
	// MPropertyFriendlyName = "Z Offset"
	// MPropertyDescription = "Shifts the authored capsule up or down."
	float32 m_flQueryZOffset;
};
