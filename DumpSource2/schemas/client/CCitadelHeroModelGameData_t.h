// MModelGameData
// MPropertyFriendlyName = "Citadel Hero Data"
class CCitadelHeroModelGameData_t
{
	// MPropertyStartGroup = "+Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_hAmbientParticle;
	CUtlVector< AmbientParticleSettings_t > m_vecAmbientParticleSettings;
	// MPropertyDescription = "Which attachment handle to use from the hero when creating the "zip_line_path_universal_attach" FX"
	// MPropertyCustomFGDType = "model_attachment"
	CUtlString m_strZiplineAttachFX_AttachmentName; // = "palm_L"
	// MPropertyStartGroup = "+AG2"
	// MPropertyDescription = "When true, this model will turn to face the velocity of the hero and will not strafe to face the camera's forward direction."
	bool m_bTurnToFaceVelocity;
	// MPropertySuppressExpr = "m_bTurnToFaceVelocity"
	float32 m_flTurnThreshold; // = 90
	// MPropertySuppressExpr = "m_bTurnToFaceVelocity"
	float32 m_flTurnDuration; // = 1
	// MPropertyDescription = "These are the unique aims of this hero.  If one is not specified, the "idle" aim will be used instead."
	EHeroAimAnimSet m_eUniqueAims; // = "Crouch|InAir|Run|CrouchRun|Slide"
	// MPropertyStartGroup = "+Physics / Movement"
	float32 m_flStepHeight; // = 32
	// MPropertyDescription = "Size of the capsule"
	float32 m_flCollisionRadius; // = 20
	float32 m_flCollisionHeight; // = 80
	// MPropertyStartGroup = "+Hideout Look Target"
	float32 m_flLookTargetMaxDistance; // = 250
	float32 m_flLookTargetMaxAngleUp; // = 50
	float32 m_flLookTargetMaxAngleDown; // = 50
	float32 m_flLookTargetMaxAngleLeft; // = 60
	float32 m_flLookTargetMaxAngleRight; // = 60
	float32 m_flLookTargetMaxAngleScaleWhileJumping; // = 0.5
	float32 m_flLookTargetMaxAngleScaleWhileRunning; // = 0.5
	// MPropertyStartGroup = "+Ability Settings"
	float32 m_flArtistGestureDrawingScale; // = 1
};
