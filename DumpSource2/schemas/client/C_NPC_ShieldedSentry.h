class C_NPC_ShieldedSentry : public C_NPC_SimpleAnimatingAI
{
	CCitadelAbilityComponent m_CCitadelAbilityComponent;
	// MNotSaved
	float32 m_flAttackRange;
	// MNotSaved
	float32 m_flAimPitch;
	// MNotSaved
	bool m_bHasRecentlyAttacked;
	float32 m_flLifeTime;
	GameTime_t m_flSpawnTime;
};
