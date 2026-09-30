// MHasKV3TransferPolymorphicClassname
class CAbilityPunkgoatGoatFlipVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Motion"
	CPiecewiseCurve m_ChargingSpeedCurve;
	CPiecewiseCurve m_GoingUpSpeedCurve;
	float32 m_flGroundBreakOffAngle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_Charging;
	CEmbeddedSubclass< CCitadelModifier > m_GoatGoingUp;
	CEmbeddedSubclass< CCitadelModifier > m_DamageBuff;
	CEmbeddedSubclass< CCitadelModifier > m_MaxHealthBuff;
	CEmbeddedSubclass< CCitadelModifier > m_EmpowerMelee;
	CEmbeddedSubclass< CCitadelModifier > m_LingeringAirControl;
	// MPropertyStartGroup = "Motion"
	float32 m_flDelayBeforeCasterRegainsControlAfterFlip; // = 0.06
};
