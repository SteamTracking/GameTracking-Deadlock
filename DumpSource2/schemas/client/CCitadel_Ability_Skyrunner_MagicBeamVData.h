// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Skyrunner_MagicBeamVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_ExplodeSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_MagicBeamModifier;
};
