// MGetKV3ClassDefaults = {
//	"_class": "CCitadelTriggerCorruptedItemShopVData",
//	"m_InShopModifier":
//	{
//	},
//	"m_nSpawnMusicState": "k_EMusicQueue_Invalid"
//}
// MHasKV3TransferPolymorphicClassname
class CCitadelTriggerCorruptedItemShopVData : public CEntitySubclassVDataBase
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_InShopModifier;
	// MPropertyGroupName = "Music"
	CitadelMusicMsgType m_nSpawnMusicState;
};
