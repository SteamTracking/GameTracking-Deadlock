// MGetKV3ClassDefaults = {
//	"_class": "CCitadelTriggerBonkVData",
//	"m_strBonkParticle": "",
//	"m_strBonkSound": ""
//}
// MHasKV3TransferPolymorphicClassname
class CCitadelTriggerBonkVData : public CEntitySubclassVDataBase
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_strBonkParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strBonkSound;
};
