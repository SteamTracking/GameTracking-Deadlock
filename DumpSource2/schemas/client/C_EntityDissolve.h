class C_EntityDissolve : public C_BaseModelEntity
{
	// MNotSaved
	GameTime_t m_flStartTime;
	// MNotSaved
	float32 m_flFadeInStart;
	// MNotSaved
	float32 m_flFadeInLength;
	// MNotSaved
	float32 m_flFadeOutModelStart;
	// MNotSaved
	float32 m_flFadeOutModelLength;
	// MNotSaved
	float32 m_flFadeOutStart;
	// MNotSaved
	float32 m_flFadeOutLength;
	// MNotSaved
	EntityDissolveType_t m_nDissolveType;
	// MNotSaved
	uint32 m_nMagnitude;
	// MNotSaved
	VectorWS m_vDissolverOrigin;
	// MNotSaved
	GameTime_t m_flNextSparkTime;
	// MNotSaved
	bool m_bCoreExplode;
	// MNotSaved
	bool m_bLinkedToServerEnt;
};
