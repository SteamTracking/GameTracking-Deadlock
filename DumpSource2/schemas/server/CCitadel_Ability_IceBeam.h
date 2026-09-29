class CCitadel_Ability_IceBeam : public CCitadelBaseAbility
{
	bool m_bIceBeaming;
	GameTime_t m_flNextDamageTick;
	CCitadelAbilityBeam_t m_beam;
	CUtlVector< CHandle< CBaseEntity > > m_vecEntitiesHit;
};
