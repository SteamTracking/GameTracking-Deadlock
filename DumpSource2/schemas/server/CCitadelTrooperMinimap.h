// MNetworkNoBase
class CCitadelTrooperMinimap : public CBaseEntity
{
	float32 m_flUpdateInterval;
	// MNotSaved
	CUtlVectorEmbeddedNetworkVar< STrooperFOWEntity > m_vecFOWEntities;
};
