// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_ApplyDebuff_ProcVData : public CCitadel_Modifier_BaseEventProcVData
{
	bool m_bUseNonEmbedded;
	// MPropertyGroupName = "Time"
	// MPropertyDescription = "If this is set, the modifier will use the value from this AbilityProperty as the duration, instead of AbilityDuration."
	CUtlString m_DurationAbilityPropOverride;
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_DebuffModifier;
	CSubclassName< 2 > m_NonEmbeddedModifier;
};
