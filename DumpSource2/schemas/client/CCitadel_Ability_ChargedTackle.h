class CCitadel_Ability_ChargedTackle : public C_CitadelBaseAbility
{
	bool m_bPreparing;
	bool m_bTackling;
	GameTime_t m_flTackleStartTime;
	GameTime_t m_flPrepareStartTime;
	Vector m_vecTackleDir;
	VectorWS m_vecLastPosition;
	int32 m_nStuckFramesCount;
	CUtlVector< CHandle< C_BaseEntity > > m_vecHitEnemies;
	ParticleIndex_t m_nDistancePreview;
};
