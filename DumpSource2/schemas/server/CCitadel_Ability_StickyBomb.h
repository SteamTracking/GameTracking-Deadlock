class CCitadel_Ability_StickyBomb : public CCitadelBaseAbility
{
	CHandle< CBaseEntity > m_hAutoTarget;
	GameTime_t m_flHookEndTime;
	float32 m_flBombBonusHits;
	float32 m_flBombBonusKills;
};
