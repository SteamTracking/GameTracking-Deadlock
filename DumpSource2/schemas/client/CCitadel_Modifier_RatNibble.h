class CCitadel_Modifier_RatNibble : public CCitadelModifier
{
	CUtlVector< ParticleIndex_t > m_vecRatParticles;
	GameTime_t m_flDestroyTime;
	int32 m_nRatsRemaining;
	int32 m_nArmorStacks;
};
