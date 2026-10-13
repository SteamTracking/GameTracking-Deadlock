class CCitadel_Ability_Deadpack_Flamethrower : public C_CitadelBaseAbility
{
	GameTime_t m_flNextDamageTick;
	CUtlVector< CHandle< C_BaseEntity > > m_vecEntitiesHit;
	GameTime_t m_tLastDamageDealTime;
	GameTime_t m_tActivationTime;
	GameTime_t m_tPauseBeginTime;
	bool m_bBeaming;
	CCitadelAbilityBeam_t m_beam;
};
