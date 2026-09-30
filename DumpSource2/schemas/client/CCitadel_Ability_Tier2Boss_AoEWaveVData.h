// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Tier2Boss_AoEWaveVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_InitialExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ChargeParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strAOEImpactSound;
	CSoundEventName m_strAOEAnnounceSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_AoEModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flCastCompleteToAttackTime; // = 0.5
};
