// MGetKV3ClassDefaults = {
//	"m_nType": "NOISE_STREAM_TYPE_PERLIN",
//	"m_nModifier": "NOISE_STREAM_MODIFIER_NONE",
//	"m_nTurbulence": "NOISE_STREAM_TURB_NONE",
//	"m_flOutputMin": 0.000000,
//	"m_flOutputMax": 1.000000,
//	"m_flScale": 0.100000,
//	"m_vOffsetRate":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_flOffset": 0.000000,
//	"m_nOctaves": 1,
//	"m_flTurbulenceScale": 1.250000,
//	"m_flTurbulenceMix": 0.500000,
//	"m_Oscillators":
//	[
//	]
//}
class NoiseStreamDef_t
{
	NoiseStreamType_t m_nType;
	NoiseStreamModifier_t m_nModifier;
	NoiseStreamTurbulence_t m_nTurbulence;
	// MPropertyAttributeRange = "-10000 10000"
	float32 m_flOutputMin;
	// MPropertyAttributeRange = "-10000 10000"
	float32 m_flOutputMax;
	// MPropertyAttributeRange = "biased 0.001 100"
	float32 m_flScale;
	Vector m_vOffsetRate;
	// MPropertyAttributeRange = "-1000 1000"
	float32 m_flOffset;
	// MPropertyAttributeRange = "1 4"
	int32 m_nOctaves;
	// MPropertyAttributeRange = "0 10"
	float32 m_flTurbulenceScale;
	// MPropertyAttributeRange = "0 1"
	float32 m_flTurbulenceMix;
	CUtlVector< NoiseOscillatorDef_t > m_Oscillators;
};
