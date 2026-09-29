class CAbility_Fencer_Ultimate : public CCitadelBaseAbility
{
	VectorWS m_vStartPosition;
	Vector m_vDashDirection;
	VectorWS m_vecLastPosition;
	EFencerUltState_t m_eUltState;
	GameTime_t m_flStateStartTime;
	bool m_bHitSomeone;
	CUtlVector< CHandle< CBaseEntity > > m_vecHitEnemies;
	CUtlVector< CHandle< CBaseEntity > > m_vecHitHeroes;
	GameTime_t m_flStuckTime;
	ParticleIndex_t m_UltHoldVFX;
	ParticleIndex_t m_DirPreviewVFX;
};
