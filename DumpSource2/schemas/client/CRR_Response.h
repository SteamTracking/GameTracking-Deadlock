// MGetKV3ClassDefaults = {
//	"m_Type": 0,
//	"m_szResponseName": "",
//	"m_Params":
//	{
//		"odds": 100,
//		"flags": 0
//	}
//}
class CRR_Response
{
	uint8 m_Type;
	char[192] m_szResponseName;
	// MNotSaved
	char[128] m_szMatchingRule;
	ResponseParams m_Params;
	// MNotSaved
	float32 m_fMatchScore;
	// MNotSaved
	bool m_bAnyMatchingRulesInCooldown;
	// MNotSaved
	char* m_szSpeakerContext;
	// MNotSaved
	char* m_szWorldContext;
	// MNotSaved
	ResponseFollowup m_Followup;
	// MNotSaved
	CUtlSymbol m_recipientFilter;
};
