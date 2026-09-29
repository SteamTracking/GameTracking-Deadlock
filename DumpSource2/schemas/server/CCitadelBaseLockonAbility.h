class CCitadelBaseLockonAbility : public CCitadelBaseAbility
{
	CUtlVectorEmbeddedNetworkVar< LockonTarget_t > m_vecLockonTargets;
	GameTime_t m_LockOnStartTime;
};
