class CCitadel_Artist_StrokeBlocker : public CBaseAnimGraph
{
	VectorWS m_vStrokeStart;
	VectorWS m_vStrokeEnd;
	CHandle< CCitadel_Artist_StrokeBlocker > m_hPrevBlocker;
	CHandle< CCitadel_Artist_StrokeBlocker > m_hNextBlocker;
	float32 m_flStrokeRadius;
	float32 m_flLifetime;
	CNetworkUtlVectorBase< CHandle< CBaseEntity > > m_vecOverlap;
	CUtlVector< CHandle< CBaseEntity > > m_vecPrevOverlap;
	CHandle< CBaseEntity > m_hBreaker;
};
