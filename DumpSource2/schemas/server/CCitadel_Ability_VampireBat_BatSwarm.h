class CCitadel_Ability_VampireBat_BatSwarm : public CCitadelBaseAbility
{
	int32 m_iBonusBats;
	int32 m_iBatCountOnCast;
	float32 m_flChannelTime;
	bool m_bPauseChannel;
	float32 m_flLastRemainingChannelTime;
	GameTime_t m_flNextBatTime;
};
