class CCitadel_Ability_RocketBarrage : public CCitadelBaseAbility
{
	CCitadelAutoScaledTime m_flBarrageEndTime;
	float32 m_flCurrentTimeScale;
	VectorWS m_vecAimPos;
	Vector m_vecAimVel;
	GameTime_t m_flLastUpdateTime;
};
