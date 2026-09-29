// MGetKV3ClassDefaults = {
//	"_class": "CCitadelItemPickupVData",
//	"m_flPhysicsRadius": 60.000000,
//	"m_AmbientParticle": "",
//	"m_nSpawnMusicState": "k_EMusicQueue_Invalid"
//}
// MHasKV3TransferPolymorphicClassname
class CCitadelItemPickupVData : public CEntitySubclassVDataBase
{
	float32 m_flPhysicsRadius;
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AmbientParticle;
	// MPropertyGroupName = "Music"
	CitadelMusicMsgType m_nSpawnMusicState;
};
