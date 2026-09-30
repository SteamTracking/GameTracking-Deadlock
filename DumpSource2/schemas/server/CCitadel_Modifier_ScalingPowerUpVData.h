// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_ScalingPowerUpVData : public CCitadelModifierVData
{
	CUtlVector< ScalingPowerupDefinition_t > m_vecModifierValues;
	// MPropertyDescription = "What drives each value between its min and max.  Flat holds them at their min and ignores the window below."
	EPowerupValueScaling m_eValueScaling; // = "MatchTime"
	// MPropertySuppressExpr = "m_eValueScaling != MatchTime"
	float32 m_flTimeMin; // = 10
	// MPropertySuppressExpr = "m_eValueScaling != MatchTime"
	float32 m_flTimeMax; // = 40
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BuffParticle;
	Color m_Color;
};
