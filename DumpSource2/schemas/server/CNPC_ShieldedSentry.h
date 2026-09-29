class CNPC_ShieldedSentry : public CNPC_SimpleAnimatingAI
{
	CCitadelMinimapComponent m_CCitadelMinimapComponent;
	// MNotSaved
	float32 m_flAttackRange;
	// MNotSaved
	float32 m_flAimPitch;
	// MNotSaved
	bool m_bHasRecentlyAttacked;
	float32 m_flLifeTime;
	GameTime_t m_flSpawnTime;
	float32 m_flAttackCone;
	float32 m_flTrackingSpeed;
	float32 m_flDeployTime;
	float32 m_flAttackDelay;
};
