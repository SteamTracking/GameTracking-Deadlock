// MGetKV3ClassDefaults = {
//	"_class": "ConstraintSoundInfo",
//	"m_soundProfile":
//	{
//		"_class": "SimpleConstraintSoundProfile",
//		"m_flKeyPointMinSoundThreshold": 0.000000,
//		"m_flKeyPointMaxSoundThreshold": 0.000000,
//		"m_reversalSoundThresholdSmall": 0.000000,
//		"m_reversalSoundThresholdMedium": 0.000000,
//		"m_reversalSoundThresholdLarge": 0.000000
//	},
//	"m_iszTravelSoundFwd": "",
//	"m_iszTravelSoundBack": "",
//	"m_iszReversalSoundSmall": "",
//	"m_iszReversalSoundMedium": "",
//	"m_iszReversalSoundLarge": ""
//}
// MHasKV3TransferPolymorphicClassname
class ConstraintSoundInfo
{
	// MNotSaved
	VelocitySampler m_vSampler;
	SimpleConstraintSoundProfile m_soundProfile;
	// MNotSaved
	Vector m_forwardAxis;
	CUtlSymbolLarge m_iszTravelSoundFwd;
	CUtlSymbolLarge m_iszTravelSoundBack;
	CUtlSymbolLarge m_iszReversalSoundSmall;
	CUtlSymbolLarge m_iszReversalSoundMedium;
	CUtlSymbolLarge m_iszReversalSoundLarge;
	// MNotSaved
	bool m_bPlayTravelSound;
	// MNotSaved
	bool m_bPlayReversalSound;
};
