// MHasKV3TransferPolymorphicClassname
class CModifierApplyModifierOnDamageTakenVData : public CCitadelModifierVData
{
	// MPropertyGroupName = "OnDamage Settings"
	// MPropertyDescription = "What types of damage do we apply modifiers for?"
	CUtlVector< ECitadelDamageType > m_vecDamageTypes;
	// MPropertyStartGroup = "Target Modifier"
	// MPropertyDescription = "Modifier to apply to the target dealing damage, when owner takes damage."
	CEmbeddedSubclass< CBaseModifier > m_TargetModifier;
	// MPropertyDescription = "AbilityPropVal to grab duration from."
	CUtlString m_TargetModifierDurationAbilityProp;
	// MPropertyStartGroup = "Self Modifier"
	// MPropertyDescription = "Modifier to apply to the owner, when owner takes damage."
	CEmbeddedSubclass< CBaseModifier > m_SelfModifier;
	// MPropertyDescription = "AbilityPropVal to grab duration from."
	CUtlString m_SelfModifierDurationAbilityProp;
};
