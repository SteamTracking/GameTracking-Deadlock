// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_BloodBombVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SpilledBloodModifier;
	// MPropertyStartGroup = "Misc"
	CUtlString m_strBloodSpillStatName;
};
