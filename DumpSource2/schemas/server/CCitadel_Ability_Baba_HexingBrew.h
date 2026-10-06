class CCitadel_Ability_Baba_HexingBrew : public CCitadelBaseAbility
{
	CCitadel_Ability_Baba_HexingBrew::EBrewEffect m_eBrewEffect;
	bool m_bBrewLocked;
	GameTime_t m_flBrewLockTime;
	float32 m_flBrewPausedTime;
};
