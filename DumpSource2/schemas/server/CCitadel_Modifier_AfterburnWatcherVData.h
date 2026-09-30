// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_AfterburnWatcherVData : public CCitadel_Modifier_BaseEventProcVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_AfterburnDotModifier;
	CEmbeddedSubclass< CCitadel_Modifier_Base_Buildup > m_BuildUpModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strAfterburnHitSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flLightMeleeBuildUp; // = 20
	float32 m_flHeavyMeleeBuildUp; // = 35
	float32 m_flLightMeleeRefresh; // = 1.5
	float32 m_flHeavyMeleeRefresh; // = 3
};
