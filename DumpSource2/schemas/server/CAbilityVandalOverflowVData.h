// MHasKV3TransferPolymorphicClassname
class CAbilityVandalOverflowVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_LiftModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TargetParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_TargetCastSound;
};
