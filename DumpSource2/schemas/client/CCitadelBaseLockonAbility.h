class CCitadelBaseLockonAbility : public C_CitadelBaseAbility
{
	C_UtlVectorEmbeddedNetworkVar< LockonTarget_t > m_vecLockonTargets;
	GameTime_t m_LockOnStartTime;
	ParticleIndex_t m_nTargetingLightEffect;
};
