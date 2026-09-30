class IdolParams_t
{
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_IdolModel;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_ParachuteModel;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_CrateModel;
	CUtlString m_strLoopingSequenceName;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_IdolReturnLocationParticle;
	float32 m_flIdolReturnLocationParticleScale; // = 1
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_IdolSpawnLocationParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_IdolDroppingParticle;
	CSoundEventName m_IdolSpawnSound;
	CSoundEventName m_IdolSpawnCompleteSound;
	float32 m_flIdolDropHeight; // = 1800
	float32 m_flIdolDropDuration; // = 25
};
