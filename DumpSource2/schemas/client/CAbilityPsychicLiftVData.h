// MHasKV3TransferPolymorphicClassname
class CAbilityPsychicLiftVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_LiftModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TargetParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AoEPreviewParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DirectionalBeamParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_TargetCastSound;
	CSoundEventName m_HitConfirmSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flTargetingDuration; // = 1
};
