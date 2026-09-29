// MGetKV3ClassDefaults = {
//	"_class": "CCitadelItemKothSpawnerVData",
//	"m_flPhysicsRadius": 60.000000,
//	"m_AmbientParticle": "",
//	"m_nSpawnMusicState": "k_EMusicQueue_Invalid",
//	"m_OnGroundTouchParticle": ""
//}
// MHasKV3TransferPolymorphicClassname
class CCitadelItemKothSpawnerVData : public CCitadelItemPickupVData
{
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_OnGroundTouchParticle;
};
