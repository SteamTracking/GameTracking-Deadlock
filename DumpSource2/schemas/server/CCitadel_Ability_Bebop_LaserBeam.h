class CCitadel_Ability_Bebop_LaserBeam : public CCitadelBaseAbility
{
	bool m_bZoomed;
	bool m_bAirCast;
	CCitadelAbilityBeam_t m_beam;
	float32 m_flAngleBetweenTrace;
	int32 m_nTotalDamage;
	GameTime_t m_flNextDamageTime;
};
