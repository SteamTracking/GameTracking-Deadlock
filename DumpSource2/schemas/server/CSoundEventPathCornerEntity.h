class CSoundEventPathCornerEntity : public CSoundEventMultiPointEntity
{
	CUtlSymbolLarge m_iszPathCorner;
	// MNotSaved
	CNetworkUtlVectorBase< SoundeventPathCornerPairNetworked_t > m_vecCornerPairsNetworked;
};
