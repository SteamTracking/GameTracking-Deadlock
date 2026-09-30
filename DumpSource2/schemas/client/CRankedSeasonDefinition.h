class CRankedSeasonDefinition
{
	CUtlString m_strSeasonLocName;
	ECitadelRankedType m_eRankedType; // = "k_eCitadelRankedType_Invalid"
	CUtlVector< CRankedSeasonIntervalDefinition > m_vecIntervals;
	CUtlVector< uint8 > m_vecValidPartySizes;
	bool m_bCanPartyInCalibration;
	uint32 m_unMinWins;
	uint32 m_unMinHeroWins;
	uint32 m_unMinHeroUnlocks;
	uint32 m_unCalibrationMatches;
	uint32 m_unBaseWinLossPointGrant;
};
