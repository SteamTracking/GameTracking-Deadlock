// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_HauntWatcherVData : public CCitadel_Modifier_BaseEventProcVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_HauntDamageModifier;
	CEmbeddedSubclass< CCitadel_Modifier_Base_Buildup > m_BuildUpModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_ExplodeSound;
};
