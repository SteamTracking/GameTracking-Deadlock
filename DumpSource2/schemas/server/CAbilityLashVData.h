// MHasKV3TransferPolymorphicClassname
class CAbilityLashVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_LashParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_AirControlModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strVictimCastSound;
};
