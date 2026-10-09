// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_ChessMaster_CheckWatcherVData : public CCitadel_Modifier_Intrinsic_BaseVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_StackModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ImmobilizeModifier;
	CEmbeddedSubclass< CCitadelModifier > m_CooldownModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strSuccessProcSound;
};
