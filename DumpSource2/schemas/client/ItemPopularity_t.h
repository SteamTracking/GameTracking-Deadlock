class ItemPopularity_t
{
	uint32 m_unTimestamp;
	CUtlOrderedMap< ECitadelItemGamePhase, CUtlOrderedMap< CUtlString, ItemPopularityEntry_t > > m_mapManualItemPopularity;
	CUtlOrderedMap< ECitadelItemGamePhase, CUtlOrderedMap< CUtlString, ItemPopularityEntry_t > > m_mapGeneratedItemPopularity;
};
