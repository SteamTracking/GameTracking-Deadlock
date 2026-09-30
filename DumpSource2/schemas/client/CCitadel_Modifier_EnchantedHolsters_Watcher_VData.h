// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_EnchantedHolsters_Watcher_VData : public CCitadel_Modifier_Intrinsic_BaseVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strRefreshStackSound;
};
