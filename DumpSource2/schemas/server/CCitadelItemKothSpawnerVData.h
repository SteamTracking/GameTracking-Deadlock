// MGetKV3ClassDefaults = {
//	"_class": "CCitadelItemKothSpawnerVData",
//	"m_AmbientParticle": "",
//	"m_OnGroundTouchParticle": ""
//}
// MHasKV3TransferPolymorphicClassname
class CCitadelItemKothSpawnerVData : public CCitadelItemPickupVData
{
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_OnGroundTouchParticle;
};
