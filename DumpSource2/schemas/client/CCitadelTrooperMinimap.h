// MNetworkNoBase
class CCitadelTrooperMinimap : public C_BaseEntity
{
	float32 m_flUpdateInterval;
	// MNotSaved
	C_UtlVectorEmbeddedNetworkVar< STrooperFOWEntity > m_vecFOWEntities;
};
