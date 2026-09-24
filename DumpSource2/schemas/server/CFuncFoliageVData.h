// MGetKV3ClassDefaults = {
//	"_class": "CFuncFoliageVData",
//	"m_BulletImpactParticle": "",
//	"m_BulletExitParticle": ""
//}
// MHasKV3TransferPolymorphicClassname
class CFuncFoliageVData : public CEntitySubclassVDataBase
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BulletImpactParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BulletExitParticle;
};
