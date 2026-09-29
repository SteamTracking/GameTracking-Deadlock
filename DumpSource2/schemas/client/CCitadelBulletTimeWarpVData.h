// MGetKV3ClassDefaults = {
//	"_class": "CCitadelBulletTimeWarpVData",
//	"m_TimeWallHitParticle": "",
//	"m_TimeWallHitTimerParticle": "",
//	"m_TimeWallAllyBulletTracer": "",
//	"m_strTimeWallHitSound": ""
//}
// MHasKV3TransferPolymorphicClassname
class CCitadelBulletTimeWarpVData : public CEntitySubclassVDataBase
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TimeWallHitParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TimeWallHitTimerParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TimeWallAllyBulletTracer;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strTimeWallHitSound;
};
