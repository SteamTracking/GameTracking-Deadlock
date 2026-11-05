// MEntityAllowsPortraitWorldSpawn
class CCitadelRankedSeasonRewardProp : public CDynamicProp, public IHideoutInteractable
{
	CEntityIOOutput m_OnPropEnabled;
	CEntityIOOutput m_OnPropDisabled;
	uint32 m_unAccountID;
	ECitadelRankedType m_eRankedType;
	RankInterval_t m_unRankInterval;
	PackedRank_t m_unPackedRank;
};
