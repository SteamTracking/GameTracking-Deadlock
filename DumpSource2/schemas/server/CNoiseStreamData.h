// MGetKV3ClassDefaults = {
//	"m_Stream":
//	{
//		"m_nType": "NOISE_STREAM_TYPE_PERLIN",
//		"m_nModifier": "NOISE_STREAM_MODIFIER_NONE",
//		"m_nTurbulence": "NOISE_STREAM_TURB_NONE",
//		"m_flOutputMin": 0.000000,
//		"m_flOutputMax": 1.000000,
//		"m_flScale": 0.100000,
//		"m_vOffsetRate":
//		[
//			0.000000,
//			0.000000,
//			0.000000
//		],
//		"m_flOffset": 0.000000,
//		"m_nOctaves": 1,
//		"m_flTurbulenceScale": 1.250000,
//		"m_flTurbulenceMix": 0.500000,
//		"m_Oscillators":
//		[
//		]
//	}
//}
// MVDataRoot
// MVDataOverlayType = 1
// MVDataAssociatedFile = "scripts/noise_presets.vdata"
// MVDataPreviewWidget = "noise_stream"
class CNoiseStreamData
{
	// MPropertyDescription = "The noise itself"
	NoiseStreamDef_t m_Stream;
};
