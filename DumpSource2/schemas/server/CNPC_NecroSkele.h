class CNPC_NecroSkele : public CAI_CitadelNPC
{
	CHandle< CCitadelBaseAbility > m_hCastingAbility;
	GameTime_t m_tSpawnTime;
	VectorWS m_vecCastLocation;
	bool m_bDontMove;
	// MNotSaved
	float32 m_flAttackRange;
	// MNotSaved
	float32 m_flSpawnDuration;
};
