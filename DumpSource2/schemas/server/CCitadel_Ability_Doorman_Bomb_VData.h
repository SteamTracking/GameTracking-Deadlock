// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Doorman_Bomb_VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_MiniExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ImpactParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_ExplosionSound;
	CSoundEventName m_ImpactSound;
	CSoundEventName m_HitConfirmSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_InaccuracyModifier;
	CEmbeddedSubclass< CCitadelModifierAura > m_AuraModifier;
	// MPropertyStartGroup = "GamePlay"
	CPiecewiseCurve m_ProjectileDragCurve;
	float32 m_flShakeAmp; // = 5
	float32 m_flShakeFreq; // = 5
	float32 m_flShakeDuration; // = 2
};
