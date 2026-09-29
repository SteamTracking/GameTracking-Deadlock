class CCitadel_Ability_VampireBat_BatBlink : public CCitadelBaseAbility
{
	int32 m_iRemainingCasts;
	bool m_bIsBlinking;
	GameTime_t m_RecastEndTime;
	GameTime_t m_BlinkEndTime;
};
