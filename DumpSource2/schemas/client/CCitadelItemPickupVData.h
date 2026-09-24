// MGetKV3ClassDefaults = {
//	"_class": "CCitadelItemPickupVData",
//	"m_AmbientParticle": ""
//}
// MHasKV3TransferPolymorphicClassname
class CCitadelItemPickupVData : public CEntitySubclassVDataBase
{
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AmbientParticle;
};
