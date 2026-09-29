// MGetKV3ClassDefaults = {
//	"m_fldbOutputGain": 0.000000,
//	"m_fldbCompressionThreshold": -6.000000,
//	"m_fldbKneeWidth": 0.000000,
//	"m_flCompressionRatio": 2.000000,
//	"m_flAttackTimeMS": 100.000000,
//	"m_flReleaseTimeMS": 400.000000,
//	"m_flRMSTimeMS": 300.000000,
//	"m_flWetMix": 1.000000,
//	"m_flSCHighPassFreq": 0.000000,
//	"m_bPeakMode": false,
//	"m_bAutoMakeupGain": false
//}
class VMixDynamicsCompressorDesc_t
{
	// MPropertyFriendlyName = "Output Gain (dB)"
	float32 m_fldbOutputGain;
	// MPropertyFriendlyName = "Threshold (dB)"
	float32 m_fldbCompressionThreshold;
	// MPropertyFriendlyName = "Knee Width (dB)"
	float32 m_fldbKneeWidth;
	// MPropertyFriendlyName = "Compression Ratio"
	float32 m_flCompressionRatio;
	// MPropertyFriendlyName = "Attack time (ms)"
	float32 m_flAttackTimeMS;
	// MPropertyFriendlyName = "Release time (ms)"
	float32 m_flReleaseTimeMS;
	// MPropertyFriendlyName = "Threshold detection time (ms)"
	float32 m_flRMSTimeMS;
	// MPropertyFriendlyName = "Dry/Wet"
	float32 m_flWetMix;
	// MPropertyFriendlyName = "SideChain Highpass"
	float32 m_flSCHighPassFreq;
	// MPropertyFriendlyName = "Peak mode"
	bool m_bPeakMode;
	// MPropertyFriendlyName = "Auto Make-up Gain"
	bool m_bAutoMakeupGain;
};
