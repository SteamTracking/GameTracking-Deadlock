// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_AbilityResourcePoolVData : public CCitadel_Modifier_Intrinsic_BaseVData
{
	// MPropertyDescription = "Ability property that sizes the pool. Empty for no max contribution."
	CUtlString m_strMaxResourceProperty;
	// MPropertyDescription = "Added to the max after the property, e.g. a +1 rounding buffer."
	float32 m_flMaxResourceAdditive;
	// MPropertyDescription = "Ability property for regen per second. Empty for no regen contribution."
	CUtlString m_strRegenPerSecondProperty;
	// MPropertyDescription = "When true, the regen property is a drain rate and is negated."
	bool m_bRegenPropertyIsDrain;
};
