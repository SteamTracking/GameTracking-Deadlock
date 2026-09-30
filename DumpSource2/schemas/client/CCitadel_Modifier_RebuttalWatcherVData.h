// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_RebuttalWatcherVData : public CCitadel_Modifier_Intrinsic_BaseVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strSuccessProcSound;
	CSoundEventName m_strLightMeleeSweetenerSound;
	CSoundEventName m_strHeavyMeleeSweetenerSound;
};
