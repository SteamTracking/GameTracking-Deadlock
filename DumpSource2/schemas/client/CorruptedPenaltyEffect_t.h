class CorruptedPenaltyEffect_t
{
	// MPropertyDescription = "Modifier value this penalty feeds."
	EModifierValue m_eModifierValue; // = "MODIFIER_VALUE_INVALID"
	// MPropertyDescription = "Penalty per item tier, indexed by EModTier_t exactly like m_nItemCorruptionPricePerTier.  Authored like an upgrade bonus, e.g. -12 or -2m."
	CUtlString[6] m_strBonusPerTier;
	// MPropertyDescription = "Set this so we know how to display the value (prefix, postfix, and # decimal places)"
	EStatsType m_eDisplayType; // = "EStatsCount"
	// MPropertyDescription = "Localization stem in citadel_attributes used for the label, prefix and postfix"
	CUtlString m_strLocTokenOverride;
	CUtlString m_strCSSClass;
	// MPropertyDescription = "When false the effect is applied but never shown.  Used for hidden twins such as tech radius or heal amp regen."
	bool m_bDisplay; // = true
};
