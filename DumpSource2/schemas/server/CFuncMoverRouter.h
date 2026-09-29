class CFuncMoverRouter : public CLogicalEntity
{
	int32 m_nMoverIndex;
	bool m_bRouteToAllMovers;
	CHandle< CPathMover > m_hPathMover;
	CUtlSymbolLarge m_iszPathMoverName;
};
