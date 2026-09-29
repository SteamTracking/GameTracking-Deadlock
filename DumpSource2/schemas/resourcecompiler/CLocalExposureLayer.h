// MGetKV3ClassDefaults = {
//	"_class": "CLocalExposureLayer",
//	"m_name": "Local Exposure 1",
//	"m_nOpacityPercent": 100,
//	"m_bVisible": true,
//	"m_pLayerMask": null,
//	"m_params":
//	{
//		"m_fShadowOffsetEV": 0.000000,
//		"m_fHighlightOffsetEV": 0.000000,
//		"m_fSigma": 0.500000,
//		"m_fBoostLocalContrast": 0.000000
//	}
//}
// MHasKV3TransferPolymorphicClassname
class CLocalExposureLayer : public CColorCorrectionLayer
{
	PostProcessingLocalExposureParameters_t m_params;
};
