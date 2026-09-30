// MHasKV3TransferPolymorphicClassname
class CCitadelTriggerCorruptedItemShopVData : public CEntitySubclassVDataBase
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_InShopModifier;
	// MPropertyGroupName = "Music"
	CitadelMusicMsgType m_nSpawnMusicState; // = "k_EMusicQueue_Invalid"
};
