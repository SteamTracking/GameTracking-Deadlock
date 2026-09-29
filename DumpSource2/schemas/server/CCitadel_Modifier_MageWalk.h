class CCitadel_Modifier_MageWalk : public CCitadelModifier
{
	bool m_bIsFakeout;
	bool m_bTeleported;
	ParticleIndex_t m_particleStart;
	ParticleIndex_t m_particleEnd;
	ParticleIndex_t m_particleTrail;
	VectorWS m_vecEndLocation;
	VectorWS m_vecStartPosition;
	VectorWS m_vecEndLocationCaster;
};
