// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_FlameDashGroundAuraVData : public CCitadelModifierAuraVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_GroundParticle;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flHeight; // = 80
};
