class CPathMover : public CPathWithDynamicNodes
{
	CUtlVector< CHandle< CFuncMover > > m_vecMovers;
	CUtlVector< CHandle< CPathMoverEntitySpawner > > m_vecSpawners;
	CUtlSymbolLarge m_iszMoverSpawnerName;
	CHandle< CFuncMoverRouter > m_hMoverRouter;
	CUtlSymbolLarge m_iszMoverRouterName;
	float32 m_flSampleSpacing;
};
