class C_Citadel_Artist_StrokeBlocker : public CBaseAnimGraph
{
	VectorWS m_vStrokeStart;
	VectorWS m_vStrokeEnd;
	CHandle< C_Citadel_Artist_StrokeBlocker > m_hPrevBlocker;
	CHandle< C_Citadel_Artist_StrokeBlocker > m_hNextBlocker;
	float32 m_flStrokeRadius;
	float32 m_flLifetime;
	C_NetworkUtlVectorBase< CHandle< C_BaseEntity > > m_vecOverlap;
	CUtlVector< CHandle< C_BaseEntity > > m_vecPrevOverlap;
	CHandle< C_BaseEntity > m_hBreaker;
};
