// MHasKV3TransferPolymorphicClassname
class CAbilitySlideVData : public CitadelAbilityVData
{
	// MPropertyDescription = "The minimum angle we consider to be a slope.  Less than this we will consider flat ground."
	float32 m_flMinAngleToConsiderASlope;
	// MPropertyDescription = "The maximum speed we will apply acceleration up to when sliding on the steepest slope."
	float32 m_flSlideMaxSlopeMaxAccSpeed;
	// MPropertyDescription = "The maximum speed we will apply acceleration up to when sliding on the shallowest slope."
	float32 m_flSlideMinSlopeMaxAccSpeed;
	// MPropertyDescription = "When checking for a drop-slide, how long ago can the activate button have been pressed."
	float32 m_flButtonPressWindow;
	// MPropertyDescription = "When fast you can turn while sliding."
	float32 m_flTurnSpeed;
	// MPropertyDescription = "Amount of acceleration to apply on the shallowest slope"
	float32 m_flSlideMinSlopeAcceleration;
	// MPropertyDescription = "Amount of acceleration to apply on the steepest slope"
	float32 m_flSlideMaxSlopeAcceleration;
	// MPropertyDescription = "When pressing forward, how far to the side you need to look to start turning in that direction."
	float32 m_flTurnMinAngDiff;
	// MPropertyDescription = "When pressing forward, how far to the side you need to look to apply maximum turning."
	float32 m_flTurnMaxAngDiff;
	// MPropertyDescription = "For how long after landing and starting a slide on flat ground we apply 'Flat Ground Friction Grace' before applying 'Flat Ground Friction'"
	float32 m_flLandedFlatGroundFrictionGraceTime;
	// MPropertyDescription = "For how long after starting to slide on flat ground we apply 'Flat Ground Friction Grace' before applying 'Flat Ground Friction'"
	float32 m_flFlatGroundFrictionGraceTime;
	// MPropertyDescription = "The friction the player uses while sliding on flat ground."
	float32 m_flFrictionFlatGroundGrace;
	// MPropertyDescription = "The friction the player uses while sliding on flat ground."
	float32 m_flFrictionFlatGround;
	// MPropertyDescription = "The friction the player uses while sliding on our minimum slope."
	float32 m_flFrictionMinSlope;
	// MPropertyDescription = "The friction the player uses while sliding on our maximum slope."
	float32 m_flFrictionMaxSlope;
	// MPropertyDescription = "How much friction to apply when trying to slide up our minimum slope."
	float32 m_flFrictionUphillMinSlope;
	// MPropertyDescription = "How much friction to apply when trying to slide up our maximum slope."
	float32 m_flFrictionUphillMaxSlope;
	// MPropertyDescription = "When applying the landing speed boost, bias the scale based on slope by this much."
	float32 m_flLandingSlopeScaleBias;
	// MPropertyDescription = "Minimum speed to trigger a boost when landing and trying to slide."
	float32 m_flBoostMinTriggerSpeed;
	// MPropertyDescription = "Maximum speed used to determine speed boost when landing and trying to slide."
	float32 m_flBoostMaxTriggerSpeed;
	// MPropertyDescription = "Minimum speed boost to apply when landing and initiating a slide."
	float32 m_flBoostMinSpeed;
	// MPropertyDescription = "Maximumm speed boost to apply when landing and initiating a slide."
	float32 m_flBoostMaxSpeed;
	// MPropertyDescription = "How fast you have to be moving on flat ground to be able to initiate a slide."
	float32 m_flMinActivationSpeed;
	// MPropertyDescription = "If your slide speed falls below this on flat ground, you will stop sliding."
	float32 m_flMinSustainSpeed;
	// MPropertyDescription = "The amount of speed boost to apply when running forward and initiating a slide."
	float32 m_flSprintBoostSpeed;
	// MPropertyDescription = "The time after dashing to start a slide to get the full speed dash slide"
	float32 m_flDashSlideStartTime;
	// MPropertyDescription = "The speed to start a slide out of a dash."
	float32 m_flDashSlideSpeed;
	// MPropertyDescription = "The speed to start a slide out of a dash if the timing was incorrect."
	float32 m_flDashSlideFailSpeed;
	// MPropertyDescription = "Sound for succesfully executing a dash-slide"
	CSoundEventName m_strDashSlideActivate;
	// MPropertyDescription = "How long to apply 'Dash Boost Friction' after starting a slide out of a dash."
	float32 m_flDashSlideFrictionTime;
	// MPropertyDescription = "The friction to apply after starting a slide out of a dash."
	float32 m_flDashSlideFriction;
	// MPropertyDescription = "How fast you have to be moving while dashing to initiate a slide.  Mainly to prevent slowed-dash flowing into a weirdly fast slides."
	float32 m_flDashMinActivationSpeed;
	// MPropertyDescription = "The shallowest slope degree to start applying downhill acceleration."
	float32 m_flAccMinSlopeDeg;
	// MPropertyDescription = "The angle we consider the most extreme slope for applying downhill acceleration."
	float32 m_flAccMaxSlopeDeg;
	// MPropertyDescription = "How much of the downhill acceleration to apply at the minimum angle."
	float32 m_flAccMinSlopeScale;
	// MPropertyDescription = "When sliding, how far forward to look when determining our averaged current slope"
	float32 m_flSlideProbeForwardOffset;
	// MPropertyDescription = "When running on flat ground and trying to initiate a slide, how far forward to look for a slope that will let's us trigger a slide early."
	float32 m_flSlideActivationProbeForwardOffset;
	// MPropertyDescription = "Maximum distance between probe samples"
	float32 m_flMaxDistanceBetweenProbeSamples;
	// MPropertyDescription = "If activating via the lookahead probe's normal, use that normal for this long after activating to help us get over that slope."
	float32 m_flInitialSlideUseForwardProbeTime;
	// MPropertyDescription = "When trying to determine what slope we're currently only, sample this far around the player"
	float32 m_flCurrentSlopeSampleDistance;
	// MPropertyDescription = "Ignore slopes whose angle different from our velocity is this many std deviations out when sampling for current slope"
	float32 m_flSampleVelDiffStdDevScaleCutoff;
	// MPropertyDescription = "If facing further than this angle away from the direction of the slope, dont initiate a slide on it."
	float32 m_flSlopeFacingAngleToActivate;
	// MPropertyDescription = "Maximum air-drag to apply when jumping out of a slide."
	float32 m_flAirDragAfterJump;
	// MPropertyDescription = "How long to apply air-drag after jumping out of a slide."
	float32 m_flAirDragAfterJumpTime;
	// MPropertyDescription = "Air-drag applied when jumping out of a slide linearly ramps from 100% to 0% from 0' to this angle."
	float32 m_flAirDragMaxAngle;
	// MPropertyDescription = "How long you have to be walking around, not sliding until we clear the air-drag flag on jumps."
	float32 m_flAirDragResetTime;
	// MPropertyDescription = "How long after you stop sliding do we consider it to still be a slide-jump."
	float32 m_flLateSlideJumpWindow;
	// MPropertyDescription = "Speed remap to slide effect intensity"
	CRemapFloat m_SlideEffectRemap;
	// MPropertyDescription = "The curve defining the getup anim's speed penalty duration(x) and severity(y)."
	CPiecewiseCurve m_GetupSpeedCurve;
	// MPropertyDescription = "How long after you stop sliding do we consider it to still be a slide-jump."
	float32 m_flGetupBusyDuration;
	// MPropertyDescription = "The amount that sliding reduces recoil. 100 = no recoil at all."
	float32 m_flSlidingRecoilReduction; // = 50
	// MPropertyStartGroup = "Camera"
	CitadelCameraOperationsSequence_t m_cameraSequenceStartSliding; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
	CitadelCameraOperationsSequence_t m_cameraSequenceEndSliding; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SlideParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strStartSound;
	CSoundEventName m_strLoopingSound;
	CSoundEventName m_strStopSound;
};
