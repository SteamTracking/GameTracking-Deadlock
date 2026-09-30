// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifire_Priest_FlashBangBurnAuraVData : public CCitadelModifierAuraVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BurnModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_RadiusParticle;
};
