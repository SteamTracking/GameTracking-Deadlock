class CCitadel_Ability_GooBowlingBall : public C_CitadelBaseAbility
{
	int32 m_nAirJumpsLeft;
	bool m_bIsRolling;
	CHandle< C_CitadelViscousBall > m_hBall;
	EViscousBowlingBallState_t m_eRollingState;
	GameTime_t m_flNextStateTime;
	GameTime_t m_flNextWallCheck;
	GameTime_t m_flRollStartTime;
	GameTime_t m_flWallExitTime;
	Vector m_vecWallExitVelocity;
	ParticleIndex_t m_nDirectionParticleIndex;
};
