class C_CitadelTeam : public C_Team
{
	float32 m_flBaseObjectiveHealth;
	int32 m_vecBaseLocationX;
	int32 m_vecBaseLocationY;
	bool m_bHasValidBaseLocation;
	int32 m_nBossesAlive;
	int32 m_nBossesMax;
	EFlexSlotTypes_t m_nFlexSlotsUnlocked;
	int32 m_nBaseGuardianLanesCleared;
	C_UtlVectorEmbeddedNetworkVar< STeamFOWEntity > m_vecFOWEntities;
	int32 m_nStreetBrawlScore;
	int32 m_nStreetBrawlScoreLastRound;
};
