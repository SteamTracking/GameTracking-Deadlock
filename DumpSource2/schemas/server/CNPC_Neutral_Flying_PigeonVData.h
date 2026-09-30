// MHasKV3TransferPolymorphicClassname
class CNPC_Neutral_Flying_PigeonVData : public CEntitySubclassVDataBase
{
	CRangeFloat m_flFrequencyY; // = 5
	CRangeFloat m_flVerticalScale; // = 75
	CRangeFloat m_flVerticalOffset;
	CRangeFloat m_flFrequencyR; // = 5
	CRangeFloat m_flOrbitRadius; // = 80
	float32 m_flCollisionRadius; // = 15
	float32 m_flParticleRadius; // = 1
	CRangeFloat m_flLifeTime; // = 10
	float32 m_flRespawnTime; // = 4
	float32 m_flModelScale; // = 0.5
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_hModel;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SpawnParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AmbientParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DestroyParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strDestroySound;
};
