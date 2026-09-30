// MHasKV3TransferPolymorphicClassname
class CAbilityTrappersBoloVData : public CitadelAbilityVData
{
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ImpactParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_TrapModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
};
