// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_T2Boss_Stagger_WatcherVData : public CCitadelModifierVData
{
	float32 m_flDecayDuration; // = 12
	float32 m_flStaggeredDuration; // = 7
	float32 m_flBuildUpMax; // = 5
	// MPropertyFriendlyName = "Buildup Frac per Extra Player"
	// MPropertyDescription = "Frac * 5 Players to get how much extra buildup is added. Larger values make the buildup complete faster.  0.2 (*5 Players) is exactly halving the buildup time"
	float32 m_flAdditionlPlayerMinContribution; // = 0.2
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_StaggeredModifier;
	CEmbeddedSubclass< CCitadel_Modifier_Base_Buildup > m_BuildUpModifier;
};
