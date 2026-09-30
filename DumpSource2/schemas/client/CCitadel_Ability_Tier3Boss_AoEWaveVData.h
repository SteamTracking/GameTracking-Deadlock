// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Tier3Boss_AoEWaveVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AmberInitialExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AmberShrineChargeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SapphInitialExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SapphShrineChargeParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_AOEAmberImpactSound;
	CSoundEventName m_AOESapphImpactSound;
	CSoundEventName m_AOEAmberAnnounceSound;
	CSoundEventName m_AOESapphAnnounceSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_AoEModifier;
	CEmbeddedSubclass< CCitadelModifier > m_PreviewModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flCastCompleteToAttackTime; // = 0.5
	// MPropertyStartGroup = "ScreenShake"
	float32 m_flShakeRadius; // = 1000
	float32 m_flShakeAmplitue; // = 3
	float32 m_flShakeFreqency; // = 10
	float32 m_flShakeDuration; // = 3
};
