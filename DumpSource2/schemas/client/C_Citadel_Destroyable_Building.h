class C_Citadel_Destroyable_Building : public CCitadelAnimatingModelEntity
{
	CCitadelAbilityComponent m_CCitadelAbilityComponent;
	// MNotSaved
	C_UtlVectorEmbeddedNetworkVar< WeakPoint_t > m_vecWeakPoints;
	// MNotSaved
	bool m_bDestroyed;
	// MNotSaved
	bool m_bActive;
	bool m_bFinal;
};
