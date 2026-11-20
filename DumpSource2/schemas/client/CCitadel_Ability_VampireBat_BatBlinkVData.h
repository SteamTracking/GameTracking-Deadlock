// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_VampireBat_BatBlinkVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BlinkStartParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BlinkEndParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BlinkTravelParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SelfBuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	// MPropertyStartGroup = "Camera"
	CitadelCameraOperationsSequence_t m_cameraSequenceTeleport;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_BlinkStartSound;
	CSoundEventName m_BlinkEndSound;
	CSoundEventName m_BlinkEndFinalSound;
	CSoundEventName m_strWhizbySound;
};
