// MModelGameData
// MGetKV3ClassDefaults = {
//	"m_hAmbientParticle": "",
//	"m_vecAmbientParticleSettings":
//	[
//	],
//	"m_strZiplineAttachFX_AttachmentName": "palm_L",
//	"m_bTurnToFaceVelocity": false,
//	"m_flTurnThreshold": 90.000000,
//	"m_flTurnDuration": 1.000000,
//	"m_eUniqueAims": "Crouch|InAir|Run|CrouchRun|Slide",
//	"m_flStepHeight": 32.000000,
//	"m_flCollisionRadius": 20.000000,
//	"m_flCollisionHeight": 80.000000,
//	"m_flLookTargetMaxDistance": 250.000000,
//	"m_flLookTargetMaxAngleUp": 50.000000,
//	"m_flLookTargetMaxAngleDown": 50.000000,
//	"m_flLookTargetMaxAngleLeft": 60.000000,
//	"m_flLookTargetMaxAngleRight": 60.000000,
//	"m_flLookTargetMaxAngleScaleWhileJumping": 0.500000,
//	"m_flLookTargetMaxAngleScaleWhileRunning": 0.500000,
//	"m_flArtistGestureDrawingScale": 1.000000
//}
// MPropertyFriendlyName = "Citadel Hero Data"
class CCitadelHeroModelGameData_t
{
	// MPropertyStartGroup = "+Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_hAmbientParticle;
	CUtlVector< AmbientParticleSettings_t > m_vecAmbientParticleSettings;
	// MPropertyDescription = "Which attachment handle to use from the hero when creating the "zip_line_path_universal_attach" FX"
	// MPropertyCustomFGDType = "model_attachment"
	CUtlString m_strZiplineAttachFX_AttachmentName;
	// MPropertyStartGroup = "+AG2"
	// MPropertyDescription = "When true, this model will turn to face the velocity of the hero and will not strafe to face the camera's forward direction."
	bool m_bTurnToFaceVelocity;
	// MPropertySuppressExpr = "m_bTurnToFaceVelocity"
	float32 m_flTurnThreshold;
	// MPropertySuppressExpr = "m_bTurnToFaceVelocity"
	float32 m_flTurnDuration;
	// MPropertyDescription = "These are the unique aims of this hero.  If one is not specified, the "idle" aim will be used instead."
	EHeroAimAnimSet m_eUniqueAims;
	// MPropertyStartGroup = "+Physics / Movement"
	float32 m_flStepHeight;
	// MPropertyDescription = "Size of the capsule"
	float32 m_flCollisionRadius;
	float32 m_flCollisionHeight;
	// MPropertyStartGroup = "+Hideout Look Target"
	float32 m_flLookTargetMaxDistance;
	float32 m_flLookTargetMaxAngleUp;
	float32 m_flLookTargetMaxAngleDown;
	float32 m_flLookTargetMaxAngleLeft;
	float32 m_flLookTargetMaxAngleRight;
	float32 m_flLookTargetMaxAngleScaleWhileJumping;
	float32 m_flLookTargetMaxAngleScaleWhileRunning;
	// MPropertyStartGroup = "+Ability Settings"
	float32 m_flArtistGestureDrawingScale;
};
