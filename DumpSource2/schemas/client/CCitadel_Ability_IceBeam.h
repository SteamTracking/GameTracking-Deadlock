class CCitadel_Ability_IceBeam : public C_CitadelBaseAbility
{
	bool m_bIceBeaming;
	GameTime_t m_flNextDamageTick;
	CCitadelAbilityBeam_t m_beam;
	CUtlVector< CHandle< C_BaseEntity > > m_vecEntitiesHit;
};
