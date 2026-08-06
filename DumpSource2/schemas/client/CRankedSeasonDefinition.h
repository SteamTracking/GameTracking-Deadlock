// MGetKV3ClassDefaults = {
//	"m_strSeasonLocName": "",
//	"m_eRankedType": "k_eCitadelRankedType_Invalid",
//	"m_vecIntervals":
//	[
//	],
//	"m_vecValidPartySizes":
//	[
//	],
//	"m_bCanPartyInCalibration": false,
//	"m_unMinWins": 0,
//	"m_unMinHeroWins": 0,
//	"m_unMinHeroUnlocks": 0,
//	"m_unCalibrationMatches": 0,
//	"m_unBaseWinLossPointGrant": 0
//}
class CRankedSeasonDefinition
{
	CUtlString m_strSeasonLocName;
	ECitadelRankedType m_eRankedType;
	CUtlVector< CRankedSeasonIntervalDefinition > m_vecIntervals;
	CUtlVector< uint8 > m_vecValidPartySizes;
	bool m_bCanPartyInCalibration;
	uint32 m_unMinWins;
	uint32 m_unMinHeroWins;
	uint32 m_unMinHeroUnlocks;
	uint32 m_unCalibrationMatches;
	uint32 m_unBaseWinLossPointGrant;
};
