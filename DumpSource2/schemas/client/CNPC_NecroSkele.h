class CNPC_NecroSkele : public C_AI_CitadelNPC
{
	CHandle< C_CitadelBaseAbility > m_hCastingAbility;
	GameTime_t m_tSpawnTime;
	VectorWS m_vecCastLocation;
	bool m_bDontMove;
	// MNotSaved
	float32 m_flAttackRange;
	// MNotSaved
	float32 m_flSpawnDuration;
};
