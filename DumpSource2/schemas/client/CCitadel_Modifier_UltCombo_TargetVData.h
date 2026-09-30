// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_UltCombo_TargetVData : public CCitadel_Modifier_StunnedVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_AttachModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flTargetPosDistance; // = 120
	float32 m_flTargetPosRange; // = 40
	float32 m_flPullSpeedMin; // = 300
	float32 m_flPullSpeedMax; // = 1500
	float32 m_flPullDistanceMin; // = 100
	float32 m_flPullDistanceMax; // = 1000
};
