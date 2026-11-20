// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_VampireBat_BatCloudVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SelfModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AuraParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BatHitParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strFireBatSound;
	// MPropertyStartGroup = "Camera"
	CitadelCameraOperationsSequence_t m_cameraSequenceBatCloud;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flCameraForwardForce;
	float32 m_flInputForce;
	float32 m_flDampingConstant;
};
