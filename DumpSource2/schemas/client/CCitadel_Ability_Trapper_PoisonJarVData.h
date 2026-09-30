// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Trapper_PoisonJarVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_AuraModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_ExplodeSound;
};
