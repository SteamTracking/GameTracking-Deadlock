class CCitadel_Ability_Nurse_HealingNeedles : public C_CitadelBaseAbility
{
	float32 m_flChargeProgress;
	bool m_bNeedlesOut;
	GameTime_t m_tSwapInFinishTime;
	CHandle< C_CitadelBaseAbility > m_hOriginalGun;
};
