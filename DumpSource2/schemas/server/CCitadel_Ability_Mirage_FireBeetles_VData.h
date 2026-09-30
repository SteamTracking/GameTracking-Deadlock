// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Mirage_FireBeetles_VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_StatStolenDebuffModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strHitConfirmSound;
	CSoundEventName m_strWorldImpactSound;
};
