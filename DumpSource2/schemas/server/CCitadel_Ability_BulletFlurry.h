class CCitadel_Ability_BulletFlurry : public CCitadelBaseAbility
{
	CCitadelAutoScaledTime m_flFlurryEndTime;
	GameTime_t m_flNextAttackTime;
	CUtlVector< CHandle< CBaseEntity > > m_vecShootTargets;
	int32 m_nNumPlayersKilled;
	int32 m_nShootIndex;
	int32 m_nShootIndexNPC;
	int32 m_nBurstShots;
	bool m_bHasCameraOverride;
	ParticleIndex_t m_nConeVFX;
};
