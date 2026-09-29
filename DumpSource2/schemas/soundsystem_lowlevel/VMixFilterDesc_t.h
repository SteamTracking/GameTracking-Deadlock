// MGetKV3ClassDefaults = {
//	"m_fldbGain": 0.000000,
//	"m_flCutoffFreq": 1000.000000,
//	"m_flQ": 0.707107,
//	"m_nFilterType": "FILTER_UNKNOWN",
//	"m_nFilterSlope": "FILTER_SLOPE_12dB",
//	"m_bEnabled": true
//}
class VMixFilterDesc_t
{
	float32 m_fldbGain;
	float32 m_flCutoffFreq;
	float32 m_flQ;
	VMixFilterType_t m_nFilterType;
	VMixFilterSlope_t m_nFilterSlope;
	bool m_bEnabled;
};
