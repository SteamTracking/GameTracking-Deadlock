class CCitadel_Ability_PowerSlash : public CCitadelBaseYamatoAbility
{
	int32 m_nPowerLevel;
	CUtlVector< CHandle< C_BaseEntity > > m_vecHitTargets;
	ParticleIndex_t m_nCastParticle;
};
