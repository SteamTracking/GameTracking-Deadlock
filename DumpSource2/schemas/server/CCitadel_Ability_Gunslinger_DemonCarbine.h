class CCitadel_Ability_Gunslinger_DemonCarbine : public CCitadelBaseAbility
{
	bool m_bWantsSlow;
	GameTime_t m_flLatchedTimeScaleFracChangeTime;
	float32 m_flLatchedTimeScaleFrac;
	GameTime_t m_flSpeedBoostEndTime;
	GameTime_t m_flShotTimeScaleEndTime;
	float32 m_flStoredPowerPct;
};
