// MGetKV3ClassDefaults = {
//	"_class": "CClientAlphaProperty",
//	"m_nDistFadeStart": 0,
//	"m_nDistFadeEnd": 0,
//	"m_nDesyncOffset": 0,
//	"m_bAlphaOverride": 0,
//	"m_bShadowAlphaOverride": 0,
//	"m_nRenderMode": 0,
//	"m_nRenderFX": 0,
//	"m_nAlpha": 255,
//	"m_flFadeScale": 0.000000,
//	"m_flRenderFxStartTime": null,
//	"m_flRenderFxDuration": 0.000000
//}
// MHasKV3TransferPolymorphicClassname
class CClientAlphaProperty : public IClientAlphaProperty
{
	uint16 m_nDistFadeStart;
	uint16 m_nDistFadeEnd;
	bitfield:14 m_nDesyncOffset;
	bitfield:1 m_bAlphaOverride;
	bitfield:1 m_bShadowAlphaOverride;
	bitfield:3 m_nRenderMode;
	bitfield:5 m_nRenderFX;
	uint8 m_nAlpha;
	float32 m_flFadeScale;
	GameTime_t m_flRenderFxStartTime;
	float32 m_flRenderFxDuration;
};
