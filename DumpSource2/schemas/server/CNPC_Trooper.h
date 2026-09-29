class CNPC_Trooper : public CAI_CitadelNPC
{
	int32 m_iLane;
	CHandle< CInfoTrooperBossSpawn > m_hSpawnWaveController;
	CHandle< CInfoTrooperSpawn > m_hTrooperSpawnPoint;
	// MNotSaved
	CHandle< CBaseEntity > m_hTargetedEnemy;
	// MNotSaved
	bool m_bUsingBossWeapon;
};
