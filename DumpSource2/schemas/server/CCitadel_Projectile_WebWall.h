class CCitadel_Projectile_WebWall : public CCitadelProjectile
{
	bool bHasDetonatedOnTarget;
	ParticleIndex_t m_nWebWallFxIndex;
	VectorWS m_vecCastPosition;
	Vector m_vecCastPositionNormal;
	VectorWS m_vecEndPosition;
	Vector m_vecEndPositionNormal;
};
