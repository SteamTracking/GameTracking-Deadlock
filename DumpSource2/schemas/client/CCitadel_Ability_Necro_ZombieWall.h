class CCitadel_Ability_Necro_ZombieWall : public C_CitadelBaseAbility
{
	GameTime_t m_tWallDeployFinishTime;
	CUtlVector< CHandle< C_BaseEntity > > m_vecHitUnits;
};
