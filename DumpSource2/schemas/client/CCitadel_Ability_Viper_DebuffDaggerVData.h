// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Viper_DebuffDaggerVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ImpactParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strWorldImpactSound;
	CSoundEventName m_strHitConfirmSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
};
