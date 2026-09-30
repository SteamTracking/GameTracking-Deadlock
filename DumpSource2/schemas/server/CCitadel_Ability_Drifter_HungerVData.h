// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Drifter_HungerVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_TargetModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_InvisModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HungerTargetKillParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strStackGainedSound;
};
