// MGetKV3ClassDefaults = {
//	"_class": "CCitadel_PickupSpawnerVData",
//	"m_sPickup": "",
//	"m_flSpawnDelay": 0.000000,
//	"m_flSpawnDelayTest": 0.000000,
//	"m_flRespawnTime": 180.000000,
//	"m_flRespawnTimeTest": 10.000000,
//	"m_hModel": "",
//	"m_flModelScale": 1.000000
//}
// MHasKV3TransferPolymorphicClassname
class CCitadel_PickupSpawnerVData : public CEntitySubclassVDataBase
{
	// MPropertyStartGroup = "Pickup"
	// MPropertyDescription = "Which pickup subclass to spawn. Overridden by the pickup_subclass spawn key if that is set."
	CSubclassName< 0 > m_sPickup;
	// MPropertyStartGroup = "Timing"
	// MPropertyDescription = "Match clock time the pickup first appears at. Set to -1 to stay empty until something calls SpawnPickup."
	float32 m_flSpawnDelay;
	// MPropertyDescription = "In test maps, use this as our first spawn time"
	float32 m_flSpawnDelayTest;
	// MPropertyDescription = "Seconds after the pickup is collected before it comes back. Set to -1 for one and done."
	float32 m_flRespawnTime;
	// MPropertyDescription = "In test maps, use this as our respawn time"
	float32 m_flRespawnTimeTest;
	// MPropertyStartGroup = "Visuals"
	// MPropertyDescription = "Optional model for the spawner itself. Leave empty to make the spawner invisible."
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_hModel;
	float32 m_flModelScale;
};
