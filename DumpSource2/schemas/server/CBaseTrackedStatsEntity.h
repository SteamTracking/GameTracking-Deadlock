// MNetworkVarNames = "TrackedStatNetworkData_t m_vecTrackedStats"
// MClassHasEntityLimitedDataDesc
class CBaseTrackedStatsEntity : public CBaseEntity
{
	// MNetworkEnable
	// MNetworkChangeCallback = "OnTrackedStatsChanged"
	CUtlVectorEmbeddedNetworkVar< TrackedStatNetworkData_t > m_vecTrackedStats;
};
