class DamageFlashSettings_t
{
	float32 m_flDuration;
	// MPropertyAttributeEditor = "GradientWithAlpha()"
	CColorGradient m_ColorGradient;
	CRangeFloat m_flBrightness; // = 2
	CRangeFloat m_flBrightnessInLightSensitivityMode; // = 2
	bool m_bAnimateAlpha;
	// MPropertyStartGroup = "Flash Hit"
	bool m_bFlashHit;
	// MPropertySuppressExpr = "m_bFlashHit == false"
	CRangeFloat m_flFlashHitScale; // = [ 0.4, 0.6 ]
	// MPropertySuppressExpr = "m_bFlashHit == false"
	CRangeFloat m_flFlashHitRotation; // = [ 0, 360 ]
	// MPropertySuppressExpr = "m_bFlashHit == false"
	bool m_bFlashHitAnimateRadius;
	// MPropertyStartGroup = "Flash Hit/Spikes"
	// MPropertySuppressExpr = "m_bFlashHit == false"
	bool m_bFlashHitSpikes;
	// MPropertySuppressExpr = "m_bFlashHitSpikes == false"
	CRangeInt m_nSpikeCount; // = [ 6, 7 ]
	// MPropertySuppressExpr = "m_bFlashHitSpikes == false"
	CRangeFloat m_flSpikeSharpness; // = 0.5
	// MPropertyStartGroup = "Animation Curves"
	// MPropertySuppressExpr = "m_bAnimateAlpha == false"
	CPiecewiseCurve m_AlphaAnimationCurve;
	// MPropertySuppressExpr = "m_bFlashHitAnimateRadius == false"
	CPiecewiseCurve m_RadiusScaleAnimationCurve;
};
