// MGetKV3ClassDefaults = {
//	"m_flDuration": 0.000000,
//	"m_ColorGradient":
//	{
//		"m_Stops":
//		[
//		]
//	},
//	"m_flBrightness": 2.000000,
//	"m_flBrightnessInLightSensitivityMode": 2.000000,
//	"m_bAnimateAlpha": false,
//	"m_bFlashHit": false,
//	"m_flFlashHitScale":
//	[
//		0.400000,
//		0.600000
//	],
//	"m_flFlashHitRotation":
//	[
//		0.000000,
//		360.000000
//	],
//	"m_bFlashHitAnimateRadius": false,
//	"m_bFlashHitSpikes": false,
//	"m_nSpikeCount":
//	[
//		6,
//		7
//	],
//	"m_flSpikeSharpness": 0.500000,
//	"m_AlphaAnimationCurve":
//	{
//		"m_spline":
//		[
//		],
//		"m_tangents":
//		[
//		],
//		"m_vDomainMins":
//		[
//			0.000000,
//			0.000000
//		],
//		"m_vDomainMaxs":
//		[
//			0.000000,
//			0.000000
//		]
//	},
//	"m_RadiusScaleAnimationCurve":
//	{
//		"m_spline":
//		[
//		],
//		"m_tangents":
//		[
//		],
//		"m_vDomainMins":
//		[
//			0.000000,
//			0.000000
//		],
//		"m_vDomainMaxs":
//		[
//			0.000000,
//			0.000000
//		]
//	}
//}
class DamageFlashSettings_t
{
	float32 m_flDuration;
	// MPropertyAttributeEditor = "GradientWithAlpha()"
	CColorGradient m_ColorGradient;
	CRangeFloat m_flBrightness;
	CRangeFloat m_flBrightnessInLightSensitivityMode;
	bool m_bAnimateAlpha;
	// MPropertyStartGroup = "Flash Hit"
	bool m_bFlashHit;
	// MPropertySuppressExpr = "m_bFlashHit == false"
	CRangeFloat m_flFlashHitScale;
	// MPropertySuppressExpr = "m_bFlashHit == false"
	CRangeFloat m_flFlashHitRotation;
	// MPropertySuppressExpr = "m_bFlashHit == false"
	bool m_bFlashHitAnimateRadius;
	// MPropertyStartGroup = "Flash Hit/Spikes"
	// MPropertySuppressExpr = "m_bFlashHit == false"
	bool m_bFlashHitSpikes;
	// MPropertySuppressExpr = "m_bFlashHitSpikes == false"
	CRangeInt m_nSpikeCount;
	// MPropertySuppressExpr = "m_bFlashHitSpikes == false"
	CRangeFloat m_flSpikeSharpness;
	// MPropertyStartGroup = "Animation Curves"
	// MPropertySuppressExpr = "m_bAnimateAlpha == false"
	CPiecewiseCurve m_AlphaAnimationCurve;
	// MPropertySuppressExpr = "m_bFlashHitAnimateRadius == false"
	CPiecewiseCurve m_RadiusScaleAnimationCurve;
};
