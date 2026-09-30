// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Frank_PainAuraVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AuraActive;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strTripSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_AuraModifier;
	CEmbeddedSubclass< CCitadelModifier > m_AuraOffModifier;
};
