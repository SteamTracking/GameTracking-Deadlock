// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Familiar_CloneSingleVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_CloneModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ClonedParticle;
	// MPropertyStartGroup = "Cloned Abilities"
	CUtlOrderedMap< CUtlString, EAbilitySlots_t > m_mapClonedAbilities;
};
