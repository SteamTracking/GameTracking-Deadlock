class CCitadel_Ability_Tengu_StoneForm : public CCitadelBaseAbility
{
	GameTime_t m_flStartTime;
	GameTime_t m_flLandedTime;
	bool m_bLanded;
	bool m_bFalling;
	bool m_bInStoneForm;
	float32 m_flStartHeight;
	ParticleIndex_t m_nStoneFormEffect;
	CUtlVector< CHandle< CBaseEntity > > m_vecHitEntities;
};
