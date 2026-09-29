class CCitadel_Ability_Lash_Ultimate : public CCitadelBaseLockonAbility
{
	ELashGrappleState m_EGrappleState;
	GameTime_t m_flStateEnterTime;
	GameTime_t m_flNextStateTime;
	GameTime_t m_flBoostEndTime;
};
