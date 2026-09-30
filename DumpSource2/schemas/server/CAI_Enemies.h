class CAI_Enemies
{
	CUtlOrderedMap< CHandle< CBaseEntity >, AI_EnemyInfo_t* > m_Map;
	float32 m_flFreeKnowledgeDuration; // = 1.75
	float32 m_flEnemyDiscardDuration; // = 60
	float32 m_flLastAggroDecayTime;
	int32 m_nSerial;
	CHandle< CBaseEntity > m_hCurrentEnemy;
	CHandle< CBaseEntity > m_hFreeHuntTarget;
};
