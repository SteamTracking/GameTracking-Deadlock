// MHasKV3TransferPolymorphicClassname
class CCitadel_HeroTestOrbSpawnerVData : public CEntitySubclassVDataBase
{
	// MPropertyStartGroup = "Gameplay"
	int32 m_iGoldValue; // = 10
	float32 m_flSpawnRate; // = 2
	float32 m_flFirstSpawnTime; // = 180
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_hModel;
	float32 m_flModelScale; // = 1.5
	float32 m_flSpawnOffset; // = 40
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AmbientParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SpawnParticle;
};
