// MGetKV3ClassDefaults = {
//	"_class": "CLightComponent",
//	"m_Color":
//	[
//		0,
//		0,
//		0,
//		0
//	],
//	"m_SecondaryColor":
//	[
//		0,
//		0,
//		0,
//		0
//	],
//	"m_flBrightness": 0.000000,
//	"m_flBrightnessScale": 1.000000,
//	"m_flBrightnessMult": 1.000000,
//	"m_flRange": 0.000000,
//	"m_flFalloff": 0.000000,
//	"m_flAttenuation0": 0.000000,
//	"m_flAttenuation1": 0.000000,
//	"m_flAttenuation2": 0.000000,
//	"m_flTheta": 0.000000,
//	"m_flPhi": 0.000000,
//	"m_hLightCookie": "",
//	"m_nCascades": 0,
//	"m_nCastShadows": 0,
//	"m_nShadowWidth": 0,
//	"m_nShadowHeight": 0,
//	"m_bRenderDiffuse": true,
//	"m_nRenderSpecular": 1,
//	"m_bRenderTransmissive": true,
//	"m_flOrthoLightWidth": 0.000000,
//	"m_flOrthoLightHeight": 0.000000,
//	"m_nStyle": 0,
//	"m_Pattern": "",
//	"m_nCascadeRenderStaticObjects": -1,
//	"m_flShadowCascadeCrossFade": 0.000000,
//	"m_flShadowCascadeDistanceFade": 0.000000,
//	"m_flShadowCascadeDistance0": 0.000000,
//	"m_flShadowCascadeDistance1": 0.000000,
//	"m_flShadowCascadeDistance2": 0.000000,
//	"m_flShadowCascadeDistance3": 0.000000,
//	"m_nShadowCascadeResolution0": 0,
//	"m_nShadowCascadeResolution1": 0,
//	"m_nShadowCascadeResolution2": 0,
//	"m_nShadowCascadeResolution3": 0,
//	"m_bUsesBakedShadowing": false,
//	"m_nShadowPriority": -1,
//	"m_nBakedShadowIndex": -1,
//	"m_nLightPathUniqueId": 0,
//	"m_nLightMapUniqueId": 0,
//	"m_bRenderToCubemaps": true,
//	"m_bAllowSSTGeneration": true,
//	"m_nDirectLight": 0,
//	"m_nBounceLight": 0,
//	"m_flBounceScale": 0.000000,
//	"m_flFadeMinDist": 0.000000,
//	"m_flFadeMaxDist": 0.000000,
//	"m_flShadowFadeMinDist": 0.000000,
//	"m_flShadowFadeMaxDist": 0.000000,
//	"m_bEnabled": false,
//	"m_bFlicker": false,
//	"m_bPrecomputedFieldsValid": false,
//	"m_vPrecomputedBoundsMins":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_vPrecomputedBoundsMaxs":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_vPrecomputedOBBOrigin":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_vPrecomputedOBBAngles":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_vPrecomputedOBBExtent":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_flPrecomputedMaxRange": 0.000000,
//	"m_nFogLightingMode": 0,
//	"m_flFogContributionStength": 1.000000,
//	"m_flNearClipPlane": 1.000000,
//	"m_SkyColor":
//	[
//		0,
//		0,
//		0,
//		0
//	],
//	"m_flSkyIntensity": 0.000000,
//	"m_SkyAmbientBounce":
//	[
//		0,
//		0,
//		0,
//		0
//	],
//	"m_bUseSecondaryColor": false,
//	"m_flLightStyleStartTime": null,
//	"m_flCapsuleLength": 0.000000,
//	"m_flMinRoughness": 0.000000,
//	"m_bPvsModifyEntity": false
//}
// MHasKV3TransferPolymorphicClassname
class CLightComponent : public CEntityComponent
{
	// MNotSaved
	CNetworkVarChainer __m_pChainEntity;
	Color m_Color;
	Color m_SecondaryColor;
	float32 m_flBrightness;
	float32 m_flBrightnessScale;
	float32 m_flBrightnessMult;
	float32 m_flRange;
	float32 m_flFalloff;
	float32 m_flAttenuation0;
	float32 m_flAttenuation1;
	float32 m_flAttenuation2;
	float32 m_flTheta;
	float32 m_flPhi;
	CStrongHandle< InfoForResourceTypeCTextureBase > m_hLightCookie;
	int32 m_nCascades;
	int32 m_nCastShadows;
	int32 m_nShadowWidth;
	int32 m_nShadowHeight;
	bool m_bRenderDiffuse;
	int32 m_nRenderSpecular;
	bool m_bRenderTransmissive;
	float32 m_flOrthoLightWidth;
	float32 m_flOrthoLightHeight;
	int32 m_nStyle;
	CUtlString m_Pattern;
	int32 m_nCascadeRenderStaticObjects;
	float32 m_flShadowCascadeCrossFade;
	float32 m_flShadowCascadeDistanceFade;
	float32 m_flShadowCascadeDistance0;
	float32 m_flShadowCascadeDistance1;
	float32 m_flShadowCascadeDistance2;
	float32 m_flShadowCascadeDistance3;
	int32 m_nShadowCascadeResolution0;
	int32 m_nShadowCascadeResolution1;
	int32 m_nShadowCascadeResolution2;
	int32 m_nShadowCascadeResolution3;
	bool m_bUsesBakedShadowing;
	int32 m_nShadowPriority;
	int32 m_nBakedShadowIndex;
	int32 m_nLightPathUniqueId;
	int32 m_nLightMapUniqueId;
	bool m_bRenderToCubemaps;
	bool m_bAllowSSTGeneration;
	int32 m_nDirectLight;
	int32 m_nBounceLight;
	float32 m_flBounceScale;
	float32 m_flFadeMinDist;
	float32 m_flFadeMaxDist;
	float32 m_flShadowFadeMinDist;
	float32 m_flShadowFadeMaxDist;
	bool m_bEnabled;
	bool m_bFlicker;
	bool m_bPrecomputedFieldsValid;
	Vector m_vPrecomputedBoundsMins;
	Vector m_vPrecomputedBoundsMaxs;
	Vector m_vPrecomputedOBBOrigin;
	QAngle m_vPrecomputedOBBAngles;
	Vector m_vPrecomputedOBBExtent;
	float32 m_flPrecomputedMaxRange;
	int32 m_nFogLightingMode;
	float32 m_flFogContributionStength;
	float32 m_flNearClipPlane;
	Color m_SkyColor;
	float32 m_flSkyIntensity;
	Color m_SkyAmbientBounce;
	bool m_bUseSecondaryColor;
	// MNotSaved
	bool m_bMixedShadows;
	GameTime_t m_flLightStyleStartTime;
	float32 m_flCapsuleLength;
	float32 m_flMinRoughness;
	bool m_bPvsModifyEntity;
};
