class CitadelAbilityProjectileCreateInfo_t
{
	VectorWS m_vecCreatePosition;
	QAngle m_angAngles;
	Vector m_vecVelocity;
	float32 m_flLifeTime;
	bool m_bWantsInitialVelocity;
	float32 m_flChargeAmount;
	CUtlString m_sOverrideClassName;
	bool m_bShouldHitThrower;
	bool m_bLagCompensatePosition;
	float32 m_flHitThrowerDelay;
	CUtlString m_sModelOverrideName;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_sTrailParticleOverrideName;
	int32 m_nNumDetonations;
};
