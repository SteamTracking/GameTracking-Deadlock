// MGetKV3ClassDefaults = {
//	"_class": "CCitadelBulletRedirectVolumeVData",
//	"m_RedirectParticle": ""
//}
// MHasKV3TransferPolymorphicClassname
class CCitadelBulletRedirectVolumeVData : public CEntitySubclassVDataBase
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_RedirectParticle;
};
