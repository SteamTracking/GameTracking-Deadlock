class CEntityFlame : public CBaseEntity
{
	CHandle< CBaseEntity > m_hEntAttached;
	bool m_bCheapEffect;
	float32 m_flSize;
	// MNotSaved
	bool m_bUseHitboxes;
	// MNotSaved
	int32 m_iNumHitboxFires;
	// MNotSaved
	float32 m_flHitboxFireScale;
	GameTime_t m_flLifetime;
	// MNotSaved
	CHandle< CBaseEntity > m_hAttacker;
	AI_VolumetricEventHandle_t[2] m_pMoveAwaySound;
	// MNotSaved
	float32 m_flDirectDamagePerSecond;
	// MNotSaved
	int32 m_iCustomDamageType;
};
