class CCitadel_Ability_SuperNeutralCharge : public C_CitadelBaseAbility
{
	bool m_bPreparing;
	bool m_bTackling;
	GameTime_t m_flTackleStartTime;
	float32 m_flTackleDuration;
	Vector m_vecTackleDir;
	VectorWS m_vecLastPosition;
	int32 m_nStuckFramesCount;
	CUtlVector< CEntityIndex > m_vecHitEnemies;
	GameTime_t m_flPrepareStartTime;
	ParticleIndex_t m_nDistancePreview;
};
