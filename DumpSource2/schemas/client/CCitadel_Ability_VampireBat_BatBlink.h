class CCitadel_Ability_VampireBat_BatBlink : public C_CitadelBaseAbility
{
	int32 m_iRemainingCasts;
	bool m_bIsBlinking;
	GameTime_t m_RecastEndTime;
	GameTime_t m_BlinkEndTime;
};
