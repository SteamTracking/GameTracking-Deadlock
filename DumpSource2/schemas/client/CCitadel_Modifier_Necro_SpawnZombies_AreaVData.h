// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Necro_SpawnZombies_AreaVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SummonParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SummonModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SummonDecayModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SpawningInModifier;
	// MPropertyStartGroup = "Gameplay"
	bool m_bDebug;
	float32 m_flRandomSpawnOffsetPerSummon;
	float32 m_flZombieSpawnVerticalOffset; // = 5
	float32 m_flZombieSpawnForwardOffset; // = 60
	float32 m_flZombieSpawnNavMeshSearchDistance; // = 20
	float32 m_flForwardWalkDistance; // = 200
	float32 m_flWalkDestinationRandomness; // = 200
	float32 m_flSpawningInTime; // = 0.1
};
