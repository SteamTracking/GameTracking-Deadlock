class CCitadelProjectile : public CBaseModelEntity
{
	float32 m_flMaxDistance;
	uint64 m_nCachedExcludeFlags;
	bool m_bInPortalEnvironment;
	bool m_bHandlingPortalResult;
	float32 m_flArmingTime;
	float32 m_flChargeAmount;
	bool m_bCollideWithThrower;
	bool m_bNewCollideWithThrower;
	float32 m_flTickSoundInterval;
	int32 m_nNumDetonations;
	int32 m_nDetonationsLeft;
	VectorWS m_vLastAbsOrigin;
	Vector m_vLastAbsVelocity;
	CUtlVector< CHandle< CBaseEntity > > m_vecTargetToIgnore;
	bool m_bDetonateStarted;
	bool m_bTouchDisabled;
	Vector m_vInitialVelocity;
	VectorWS m_vInitialPosition;
	CUtlStringToken m_abilityID;
	CStrongHandle< InfoForResourceTypeIParticleSystemDefinition > m_hParticleDef;
	VectorWS m_vecSpawnPosition;
	float32 m_flProjectileSpeed;
	float32 m_flMaxLifetime;
	float32 m_flParticleRadius;
};
