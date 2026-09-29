class CAbility_Synth_PlasmaFlux : public CCitadelBaseAbility
{
	bool m_bTeleported;
	CUtlVector< CHandle< CBaseEntity > > m_vecUniqueHitList;
	VectorWS m_vLastValidTeleportPosition;
	GameTime_t m_flProjectileLaunchTime;
	GameTime_t m_flProjectileExpireTime;
	CHandle< CBaseEntity > m_hActiveProjectile;
};
