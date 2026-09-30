// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Basic_HealthRegenVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Sounds"
	HealingOverTimeLoopSoundOverride_t m_HealingLoopSoundOverride;
	// MPropertyStartGroup = "Gameplay"
	bool m_bSnapshotRegen;
	CUtlString m_strRegenAbilityPropertyName;
	CUtlString m_strExternalRegenAbilityPropertyName;
};
