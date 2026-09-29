class CCitadel_Ability_GooBowlingBall : public CCitadelBaseAbility
{
	int32 m_nAirJumpsLeft;
	bool m_bIsRolling;
	CHandle< CCitadelViscousBall > m_hBall;
	EViscousBowlingBallState_t m_eRollingState;
	GameTime_t m_flNextStateTime;
	GameTime_t m_flNextWallCheck;
	GameTime_t m_flRollStartTime;
	GameTime_t m_flWallExitTime;
	Vector m_vecWallExitVelocity;
};
