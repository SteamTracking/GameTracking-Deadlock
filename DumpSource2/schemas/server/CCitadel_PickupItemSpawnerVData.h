// MHasKV3TransferPolymorphicClassname
class CCitadel_PickupItemSpawnerVData : public CEntitySubclassVDataBase
{
	// MPropertyGroupName = "Visuals"
	// MPropertyDescription = "Model"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_hModel;
	float32 m_flModelScale; // = 1
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_InactiveParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ActiveParticle;
	// MPropertyStartGroup = "Pickup rewards"
	CUtlOrderedMap< CSubclassName< 0 >, float32 > m_mapPickupChances;
	// MPropertyDescription = "Ignore 'Pickups Rewards' and only spawn one type"
	CSubclassName< 0 > m_sSinglePickupOverride;
	// MPropertyStartGroup = "Gameplay"
	// MPropertyDescription = "Set to -1 to not spawn until invoked by another system"
	float32 m_flInitialSpawnTime; // = 600
	float32 m_flRespawnTime; // = 300
	// MPropertyDescription = "Set to -1 to not spawn until invoked by another system"
	float32 m_flInitialSpawnTimeTest; // = 1
	float32 m_flRespawnTimeTest; // = 20
	bool m_bRespawnTimerStartsAfterPickup;
	// MPropertyDescription = "Will ping when the powerup spawns if this is true"
	bool m_bPingFirstPowerupSpawn;
	// MPropertySuppressExpr = "m_bPingFirstPowerupSpawn == false"
	float32 m_flInitialPingDelay; // = -1
};
