// MHasKV3TransferPolymorphicClassname
class CBaseDashCastAbilityVData : public CitadelAbilityVData
{
	CSubclassName< 4 > m_AbilityToTrigger;
	// MPropertyDescription = "How big of a trigger to use when tracing for targets"
	float32 m_flDashCastTriggerRadius; // = 50
	// MPropertyDescription = "How fast the dash should go.  When using the curve, the dash will travel this speen when y=1"
	float32 m_flDashSpeed; // = 300
	// MPropertyDescription = "When true, speed will be set to 0 when the dash cast ends"
	bool m_bSnapToZeroSpeedOnEnd;
	// MPropertyDescription = "When true, use the curve below to scale the speed of the dash across the distance."
	bool m_bUseCurveToDefineSpeed;
	// MPropertySuppressExpr = "m_bUseCurveToDefineSpeed == false"
	CPiecewiseCurve m_MovementSpeedCurve;
	// MPropertySuppressField
	float32 m_flMovementSpeedCurveAvgSpeed;
	// MPropertyStartGroup = "Sounds"
	// MPropertyDescription = "Sound to play if we hit a target."
	CSoundEventName m_strTargetHitSound;
	// MPropertyDescription = "Sound to play if miss entirely.  Only the caster hears it."
	CSoundEventName m_strMissSound;
};
