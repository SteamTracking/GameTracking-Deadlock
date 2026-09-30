class KothParams_t
{
	float32 m_flKothRadius; // = 20
	float32 m_flKothWarningDropHeight; // = 60
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_KothEarlyWarningParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_KothSpawnLocationParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_KothOnSpawnParticle;
	CSoundEventName m_strKothSpawnLoopStartSound;
	CSoundEventName m_strKothSpawnLoopSound;
	CSoundEventName m_strKothPreSpawnLoopSound;
	CSoundEventName m_strKothSpawnCompleteSound;
};
