// MHasKV3TransferPolymorphicClassname
class CAbilityVandalSurgeVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_LiftModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TargetParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_TargetCastSound;
};
