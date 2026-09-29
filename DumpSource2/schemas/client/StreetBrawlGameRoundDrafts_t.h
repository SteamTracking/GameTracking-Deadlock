// MGetKV3ClassDefaults = {
//	"m_vecItemDraftRounds":
//	[
//	],
//	"m_chanceRare":
//	{
//	},
//	"m_chanceEnhanced":
//	{
//	}
//}
class StreetBrawlGameRoundDrafts_t
{
	CUtlVector< StreetBrawlItemDraftRoundParams_t > m_vecItemDraftRounds;
	CUtlOrderedMap< int32, float32 > m_chanceRare;
	CUtlOrderedMap< int32, float32 > m_chanceEnhanced;
};
