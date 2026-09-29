class CCitadel_Bounce_Pad : public CCitadelAnimatingModelEntity
{
	CHandle< CCitadelBaseAbility > m_hAbility;
	float32 m_flUpFactor;
	float32 m_flBounceVelocity;
	GameTime_t m_tDeactivationTime;
	bool m_bDeactivated;
	float32 m_flBarrelBounceVelocity;
	float32 m_flBarrelUpFactor;
	bool m_bSpeedOnLand;
	CUtlVector< CHandle< CBaseEntity > > m_vBouncedPlayerBefore;
};
