// MGetKV3ClassDefaults = {
//	"m_eModifierValue": "MODIFIER_VALUE_MATERIAL_OVERRIDE",
//	"m_eType": "eFloat",
//	"m_value": 0.000000,
//	"m_sModelValue": "",
//	"m_sParticleValue": "",
//	"m_sStringValue": ""
//}
class ModifierScriptValue_t
{
	EModifierValue m_eModifierValue;
	ModifierScriptVariantType_t m_eType;
	// MPropertySuppressExpr = "m_eType != eFloat && m_eType != eBoolean && m_eType != eInteger"
	CModifierLevelFloat m_value;
	// MPropertySuppressExpr = "m_eType != eModelName"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_sModelValue;
	// MPropertySuppressExpr = "m_eType != eParticleName"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_sParticleValue;
	// MPropertySuppressExpr = "m_eType != eString"
	CUtlString m_sStringValue;
};
