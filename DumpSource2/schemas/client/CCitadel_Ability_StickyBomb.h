class CCitadel_Ability_StickyBomb : public C_CitadelBaseAbility
{
	CHandle< C_BaseEntity > m_hAutoTarget;
	GameTime_t m_flHookEndTime;
	float32 m_flBombBonusHits;
	float32 m_flBombBonusKills;
};
