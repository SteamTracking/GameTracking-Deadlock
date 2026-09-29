// MGetKV3ClassDefaults = {
//	"_class": "CCitadelItemPickupRejuvVData",
//	"m_flPhysicsRadius": 60.000000,
//	"m_AmbientParticle": "",
//	"m_nSpawnMusicState": "k_EMusicQueue_Invalid",
//	"m_AbilityProjectile": "",
//	"m_flMaxDistForHeal": 1400.000000,
//	"m_RebirthModifier":
//	{
//	},
//	"m_PunchPickupModifier":
//	{
//	},
//	"m_IsFrozenParticle": ""
//}
// MHasKV3TransferPolymorphicClassname
class CCitadelItemPickupRejuvVData : public CCitadelItemPickupVData
{
	CSubclassName< 4 > m_AbilityProjectile;
	float32 m_flMaxDistForHeal;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_RebirthModifier;
	CEmbeddedSubclass< CCitadelModifier > m_PunchPickupModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_IsFrozenParticle;
};
