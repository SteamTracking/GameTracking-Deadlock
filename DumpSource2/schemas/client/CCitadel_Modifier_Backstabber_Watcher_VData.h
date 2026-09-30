// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Backstabber_Watcher_VData : public CCitadel_Modifier_Intrinsic_BaseVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	// MPropertyGroupName = "Gameplay"
	float32 flDotResultMin; // = 0.15
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strHitConfirmSound;
};
