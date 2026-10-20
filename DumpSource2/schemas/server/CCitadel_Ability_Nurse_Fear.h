class CCitadel_Ability_Nurse_Fear : public CCitadelBaseAbility
{
	CUtlVector< CHandle< CBaseEntity > > m_vecBuildupTargets;
	CUtlVector< CHandle< CBaseEntity > > m_vecFearedTargets;
	GameTime_t m_flNextFakeBulletTime;
	GameTime_t m_flNextTickTime;
	GameTime_t m_flNextBuildupTickTime;
	ParticleIndex_t m_nCastDelayParticleIdx;
	ParticleIndex_t m_nChannelParticleIdx;
	QAngle m_playerAngles;
	int32 m_nLeechStacksAtCast;
	Vector m_vecRecoilDirection;
};
