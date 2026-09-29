class CCitadel_Ability_LashDownStrike : public CCitadelBaseAbility
{
	GameTime_t m_ImpactTime;
	VectorWS m_vDamagePos;
	Vector m_vDamageDir;
	CUtlVector< CHandle< CBaseEntity > > m_vHitEnemies;
	CUtlVector< CHandle< CBaseEntity > > m_vecHitEntities;
	ParticleIndex_t m_PreviewEffect;
	ParticleIndex_t m_ActiveEffect;
	bool m_bIsCrashingDown;
	Vector m_vStrikeVel;
	float32 m_flInitialYaw;
	float32 m_flStartHeight;
};
