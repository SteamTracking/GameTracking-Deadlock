class CStreetBrawlController
{
	EStreetBrawlGameState m_eStreetBrawlState;
	GameTime_t m_flStreetBrawlStateStartTime;
	GameTime_t m_flNextStateTime;
	float32 m_flStreetBrawlTotalNonCombatTime;
	int32 m_iRound;
	int32 m_iLastBuyCountDown;
	int32 m_iTeamSapphireScore;
	int32 m_iTeamAmberScore;
	float32 m_tNoTrooperTime;
	bool m_bOvertime;
	int32 m_nScoringTeam;
	CUtlVector< CHandle< CBaseEntity > > m_vTeamSapphireBoss;
	CUtlVector< CHandle< CBaseEntity > > m_vTeamAmberBoss;
	CUtlOrderedMap< CUtlString, CUtlString > m_mapOriginalConVarVals;
	CUtlVector< int32 > m_vecOfferedLegendaries;
	CUtlVector< int32 > m_vecOfferedRares;
	CUtlVector< int32 > m_vecOfferedEnhanced;
	int32 m_nShuffleSeed;
};
