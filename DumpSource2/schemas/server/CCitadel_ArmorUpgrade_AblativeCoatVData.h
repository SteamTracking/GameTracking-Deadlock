// MHasKV3TransferPolymorphicClassname
class CCitadel_ArmorUpgrade_AblativeCoatVData : public CitadelItemVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_RestoreEffectModifier;
	CEmbeddedSubclass< CCitadelModifier > m_OnTakeDamageEffectModifier;
	CEmbeddedSubclass< CCitadelModifier > m_OnBreakEffectModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ResistBuffModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flOnTakeDamageEffectDuration; // = 0.5
	float32 m_flOnBreakEffectDuration; // = 1
	float32 m_flOnRestoreEffectDuration; // = 1
};
