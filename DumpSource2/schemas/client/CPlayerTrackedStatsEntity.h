// MNetworkVarNames = "CPlayerSlot m_nPlayerSlot"
// MClassHasEntityLimitedDataDesc
class CPlayerTrackedStatsEntity : public CBaseTrackedStatsEntity
{
	// MNetworkEnable
	CPlayerSlot m_nPlayerSlot;
	int32 m_nTeam;
};
