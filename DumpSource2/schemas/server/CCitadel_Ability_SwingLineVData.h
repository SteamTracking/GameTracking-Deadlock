// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_SwingLineVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SwingModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SwingAttachParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strDaggerHitSound;
	CSoundEventName m_strDaggerExplodeSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flSwingStartDelay; // = 0.1
	float32 m_flSwingMaxDuration; // = 10
	float32 m_flMass;
	float32 m_flBodyForwardForce;
	float32 m_flCameraForwardForce;
	float32 m_flInputForce;
	float32 m_flPullForce;
	float32 m_flGravityForce;
	float32 m_flDampingConstant;
	float32 m_flIdealSpringLengthOverride; // = -1
	float32 m_flTensionSpringConstant;
	float32 m_flMaxSpringForce;
	float32 m_flMaxSpeed; // = 100
	float32 m_flWhiskerLength; // = 10
	float32 m_flWhiskerOffset; // = 3
	float32 m_flWhiskerForce; // = 1
	float32 m_flWhiskerPositionVerticalOffset; // = 30
};
