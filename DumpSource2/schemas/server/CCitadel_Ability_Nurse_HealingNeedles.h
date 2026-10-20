class CCitadel_Ability_Nurse_HealingNeedles : public CCitadelBaseAbility
{
	float32 m_flChargeProgress;
	bool m_bNeedlesOut;
	GameTime_t m_tSwapInFinishTime;
	CHandle< CCitadelBaseAbility > m_hOriginalGun;
};
