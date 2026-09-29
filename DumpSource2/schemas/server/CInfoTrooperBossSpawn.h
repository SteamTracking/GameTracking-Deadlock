class CInfoTrooperBossSpawn : public CServerOnlyPointEntity
{
	CUtlSymbolLarge m_strBossEntityName;
	int32 m_iLane;
	bool m_bReinforcementsOnly;
	bool m_bTrooperTestSpawner;
	CEntityIOOutput m_eventOnTrooperKilled;
};
