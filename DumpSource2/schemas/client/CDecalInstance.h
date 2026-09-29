// MGetKV3ClassDefaults = {
//	"m_sDecalGroup": "",
//	"m_hMaterial": "",
//	"m_sSequenceName": "",
//	"m_hEntity": null,
//	"m_nBoneIndex": -1,
//	"m_nTriangleIndex": -1,
//	"m_vPositionLS":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_vPositionOS":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_vNormalLS":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_vNormalOS":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_vSAxisLS":
//	[
//		340282346638528859811704183484516925440.000000,
//		340282346638528859811704183484516925440.000000,
//		340282346638528859811704183484516925440.000000
//	],
//	"m_nFlags": "",
//	"m_Color":
//	[
//		0,
//		0,
//		0,
//		0
//	],
//	"m_flWidth": 0.000000,
//	"m_flHeight": 0.000000,
//	"m_flDepth": 0.000000,
//	"m_mTransform":
//	[
//		0.000000,
//		0.000000,
//		0.000000,
//		0.000000,
//		0.000000,
//		0.000000,
//		0.000000,
//		0.000000,
//		0.000000,
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_mLocalToTriangle":
//	[
//		1.000000,
//		0.000000,
//		0.000000,
//		0.000000,
//		0.000000,
//		1.000000,
//		0.000000,
//		0.000000,
//		0.000000,
//		0.000000,
//		1.000000,
//		0.000000
//	],
//	"m_flAnimationScale": 0.000000,
//	"m_flAnimationStartTime": 0.000000,
//	"m_flPlaceTime": null,
//	"m_flFadeStartTime": 0.000000,
//	"m_flFadeDuration": 0.000000,
//	"m_flLightingOriginOffset": 0.000000,
//	"m_flBoundingRadiusSqr": 0.000000,
//	"m_bDoDecalLightmapping": false
//}
class CDecalInstance
{
	CGlobalSymbol m_sDecalGroup;
	CStrongHandle< InfoForResourceTypeIMaterial2 > m_hMaterial;
	CUtlStringToken m_sSequenceName;
	CHandle< C_BaseEntity > m_hEntity;
	int32 m_nBoneIndex;
	int32 m_nTriangleIndex;
	Vector m_vPositionLS;
	Vector m_vPositionOS;
	Vector m_vNormalLS;
	Vector m_vNormalOS;
	Vector m_vSAxisLS;
	DecalFlags_t m_nFlags;
	Color m_Color;
	float32 m_flWidth;
	float32 m_flHeight;
	float32 m_flDepth;
	matrix3x4_t m_mTransform;
	matrix3x4_t m_mLocalToTriangle;
	float32 m_flAnimationScale;
	float32 m_flAnimationStartTime;
	GameTime_t m_flPlaceTime;
	float32 m_flFadeStartTime;
	float32 m_flFadeDuration;
	float32 m_flLightingOriginOffset;
	float32 m_flBoundingRadiusSqr;
	// MNotSaved
	int16 m_nSequenceIndex;
	// MNotSaved
	bool m_bIsAdjacent;
	bool m_bDoDecalLightmapping;
};
