// MGetKV3ClassDefaults = {
//	"_class": "CCitadelItemPickupIdolVData",
//	"m_flPhysicsRadius": 60.000000,
//	"m_AmbientParticle": "",
//	"m_nSpawnMusicState": "k_EMusicQueue_Invalid",
//	"m_WalkBackModifier":
//	{
//	},
//	"m_PickUpAura":
//	{
//	}
//}
// MHasKV3TransferPolymorphicClassname
class CCitadelItemPickupIdolVData : public CCitadelItemPickupVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_WalkBackModifier;
	CEmbeddedSubclass< CCitadelModifier > m_PickUpAura;
};
