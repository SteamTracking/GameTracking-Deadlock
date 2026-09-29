class CCitadel_Ability_ChargedTackle : public CCitadelBaseAbility
{
	bool m_bPreparing;
	bool m_bTackling;
	GameTime_t m_flTackleStartTime;
	GameTime_t m_flPrepareStartTime;
	Vector m_vecTackleDir;
	VectorWS m_vecLastPosition;
	int32 m_nStuckFramesCount;
	CUtlVector< CHandle< CBaseEntity > > m_vecHitEnemies;
	ParticleIndex_t m_nDistancePreview;
};
