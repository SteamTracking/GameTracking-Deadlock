class CCitadel_Ability_Necro_ZombieWall : public CCitadelBaseAbility
{
	GameTime_t m_tWallDeployFinishTime;
	CUtlVector< CHandle< CBaseEntity > > m_vecHitUnits;
};
