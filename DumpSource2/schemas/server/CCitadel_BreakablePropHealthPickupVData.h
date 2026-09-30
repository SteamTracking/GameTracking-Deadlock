// MHasKV3TransferPolymorphicClassname
class CCitadel_BreakablePropHealthPickupVData : public CCitadel_Pickup_VData
{
	// MPropertyGroupName = "Visuals"
	// MPropertyFriendlyName = "AOE Heal Particle"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ParticleAOEHeal;
	// MPropertyFriendlyName = "Instant max health heal percent"
	// MPropertyDescription = "Between 0 and 100, what percent of max health should a pickup heal instantly on pickup."
	TimeScalingValue_t m_flHealMaxHealthPercent;
	// MPropertyFriendlyName = "Instant heal"
	// MPropertyDescription = "Fixed amount to heal instantly on pickup"
	TimeScalingValue_t m_flHealFixed;
	// MPropertyFriendlyName = "Instant Percent Missing Heal"
	// MPropertyDescription = "Between 0 and 100, what percent of missing health to heal instantly"
	TimeScalingValue_t m_flMissingPctHeal;
	// MPropertyFriendlyName = "Max health regen percent"
	// MPropertyDescription = "Between 0 and 100, what percent of max health should a pickup regen over time"
	TimeScalingValue_t m_flRegenMaxHealthPercent;
	// MPropertyFriendlyName = "Regen"
	// MPropertyDescription = "Amount of health to regen over time"
	TimeScalingValue_t m_flRegenFixed;
	// MPropertyFriendlyName = "Percent Missing Regen"
	// MPropertyDescription = "Between 0 and 100, what percent of missing health to regen"
	TimeScalingValue_t m_flMissingPctRegen;
	// MPropertyStartGroup = "Regen Modifier Settings"
	bool m_bUseFixedDuration; // = true
	// MPropertyDescription = "How long to apply total regen (HPS dynamically calculated)"
	float32 m_flRegenDuration; // = 1
	// MPropertyDescription = "How long to apply total regen (HPS dynamically calculated) for troopers"
	float32 m_flRegenDurationTroopers; // = 1
	// MPropertyDescription = "Amount to increase regen for troopers"
	float32 m_flRegenTrooperMulti; // = 1
	// MPropertyDescription = "How much HPS to provide (duration dynamically calculated)"
	float32 m_flRegenHPS; // = 50
	CEmbeddedSubclass< CCitadelModifier > m_RegenModifier;
	// MPropertyStartGroup = ""
	// MPropertyFriendlyName = "Heal AOE Radius"
	// MPropertyDescription = "When > 0, applies the heal to units within the radius"
	float32 m_flAOERadius;
	// MPropertyStartGroup = "AOE Heal Settings"
	// MPropertySuppressExpr = "m_flAOERadius == 0"
	// MPropertyFriendlyName = "Target Types"
	CITADEL_UNIT_TARGET_TYPE m_AOETargetTypes;
	// MPropertySuppressExpr = "m_flAOERadius == 0"
	// MPropertyFriendlyName = "Targeting Flags"
	CITADEL_UNIT_TARGET_FLAGS m_AOETargetFlags;
	// MPropertySuppressExpr = "m_flAOERadius == 0"
	// MPropertyFriendlyName = "LOS Method"
	ELOSCheck m_AOELOSCheckType; // = "None"
};
