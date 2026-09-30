// MHasKV3TransferPolymorphicClassname
class CAbilityDashVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DashParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DownDashParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_WallJumpParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strArriveSound;
	CSoundEventName m_strStaminaDrainedSound;
	// MPropertyStartGroup = "Camera"
	CitadelCameraOperationsSequence_t m_cameraSequenceGroundDashActivate; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
	CitadelCameraOperationsSequence_t m_cameraSequenceAirDashActivate; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
	// MPropertyStartGroup = "Ground Dash Stuff"
	float32 m_flMaxAngDiff; // = 20
	float32 m_flSlideCancelBlockerWindow; // = 0.2
	float32 m_flSlideLockoutTime; // = 0.4
	float32 m_flGroundDashAirbornDrag; // = 1
	float32 m_flGroundDashAirbornSpeedClamp; // = 750
	CSoundEventName m_strGroundDashSound;
	// MPropertyStartGroup = "Air Dash Stuff"
	float32 m_flAirDashEndVelocityScale; // = 0.2
	float32 m_flAirDashAccPct;
	float32 m_flDuringDrag; // = 1
	float32 m_flAirSpeedForMaxDrag; // = 14
	float32 m_flAirSpeedForMinDrag; // = 10
	float32 m_flPostMaxDrag; // = 4
	float32 m_flPostDragDuration; // = 0.1
	float32 m_flDownwardAirDashSpeed; // = 500
	// MPropertyDescription = "Fraction of the dash travel speed kept when a parry cancels the dash, so the stop tapers off instead of snapping"
	float32 m_flParryCancelSpeedScale; // = 0.4
	// MPropertyDescription = "How long ground friction stays reduced after a parry cancels a ground dash, so the kept momentum bleeds off visibly"
	float32 m_flParryCancelSlideDuration; // = 0.35
	// MPropertyDescription = "Ground friction change during the parry cancel slide, as a percentage. Negative reduces friction"
	float32 m_flParryCancelSlideFrictionPercent; // = -80
	// MPropertyDescription = "How long gravity ramps back up after a parry cancels an air dash, so the fall eases in instead of snapping on"
	float32 m_flParryCancelAirGlideDuration; // = 0.35
	// MPropertyDescription = "Gravity multiplier at the moment a parry cancels an air dash. Ramps to 1.0 over the glide duration"
	float32 m_flParryCancelAirGravityScale; // = 0.3
	CSoundEventName m_strAirDashSound;
};
