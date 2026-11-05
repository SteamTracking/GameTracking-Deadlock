// MEntityAllowsPortraitWorldSpawn
class CCitadelHideoutOwnerRankedSeasonRewardProp : public CBaseEntity
{
	CEntityIOOutput m_OnPropEnabled;
	CEntityIOOutput m_OnPropDisabled;
	ECitadelRankedType m_eRankedType;
	RankInterval_t m_unRankInterval;
};
