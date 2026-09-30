// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_RescueBeamVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BeamParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ImpactParticle;
	// MPropertyStartGroup = "Gameplay"
	bool m_bBreakOnRangeLoss; // = true
};
