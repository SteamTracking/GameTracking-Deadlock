// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_VeilWalkerWatcherVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_InvisModifier;
	CEmbeddedSubclass< CCitadelModifier > m_VeilWalkerTriggeredModifier;
	CEmbeddedSubclass< CCitadelModifier > m_VeilWalkerMovespeed;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strOwnerExpiredSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flTraceLengthMin; // = 20
};
