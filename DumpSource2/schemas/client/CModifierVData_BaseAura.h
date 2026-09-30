// MHasKV3TransferPolymorphicClassname
class CModifierVData_BaseAura : public CCitadelModifierVData
{
	AuraShapeType_t m_nAuraShapeType; // = "eSphere"
	AuraCenterType_t m_nCenterType; // = "eAbsOrigin"
	// MPropertySuppressExpr = "m_nAuraShapeType != eSphere"
	CModifierLevelFloat m_flAuraRadius;
	// MPropertySuppressExpr = "m_nAuraShapeType != eEntityBased"
	CModifierLevelFloat m_flAuraEntityBoundsScale; // = 1
	int32 m_nAmbientParticleRadiusControlPoint; // = 32
	// MPropertyDescription = "Aura - Modifier to Apply"
	// MPropertyFriendlyName = "Modifier Provided By Aura"
	CEmbeddedSubclass< CBaseModifier > m_modifierProvidedByAura;
};
