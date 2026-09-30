class ModifierScriptValue_t
{
	EModifierValue m_eModifierValue; // = "MODIFIER_VALUE_MATERIAL_OVERRIDE"
	ModifierScriptVariantType_t m_eType; // = "eFloat"
	// MPropertySuppressExpr = "m_eType != eFloat && m_eType != eBoolean && m_eType != eInteger"
	CModifierLevelFloat m_value;
	// MPropertySuppressExpr = "m_eType != eModelName"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_sModelValue;
	// MPropertySuppressExpr = "m_eType != eParticleName"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_sParticleValue;
	// MPropertySuppressExpr = "m_eType != eString"
	CUtlString m_sStringValue;
};
