// MHasKV3TransferPolymorphicClassname
class CAbilityJumpVData : public CitadelAbilityVData
{
	float32 m_flShootingLockoutAfterJump; // = 0.15
	float32 m_flShootingInaccuracyPercentageAfterJump; // = -50
	float32 m_flShootingInaccuracyDurationAfterJump; // = 0.15
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DashJumpParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AirJumpParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_WallJumpParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_GroundJumpExecutedSound;
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_AirJumpSound;
	// MPropertyStartGroup = "Air Jump"
	float32 m_flMantleRefundWindow; // = 0.1
	float32 m_flZiplineRefundWindow; // = 0.17
	float32 m_flLateJumpGraceWindow; // = 0.1
	// MPropertyDescription = "The most we'll adjust your speed in the input direction when performing an air jump"
	float32 m_flMaxSpeedDelta; // = 200
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_strDashJumpSound;
	// MPropertyStartGroup = "Roll Jump"
	float32 m_flDashJumpStartTime;
	float32 m_flDashJumpEndTime;
	// MPropertyDescription = "How far a dash jump will send you forward.  This is on top of the ~8m already traveled by the dash."
	float32 m_flDashJumpDistanceInMeters;
	float32 m_flDashJumpVerticalSpeed;
	float32 m_flDashJumpMissMaxSpeed;
	float32 m_flDashJumpMantleDisableTime; // = 0.2
	float32 m_flDashJumpExtraAirControlTime; // = 0.25
	float32 m_flDashJumpExtraAirControlPercent; // = 30
	// MPropertyStartGroup = "Wall Jump"
	// MPropertyDescription = "Basic wall jump sound"
	CSoundEventName m_WallJumpExecutedSound;
	// MPropertyDescription = "Corner Boost sound - a tricky to execute wall jump, off of an upward turned collision contact"
	CSoundEventName m_CornerBoostExecutedSound;
	// MPropertyDescription = "How far we'll trace to see if the wall we collided with is close enough to trigger a wall jump"
	float32 m_flCollidedWallMaxDist; // = 8
	// MPropertyDescription = "How far we'll trace using the player's velocity to find a wall to jump off of"
	CRemapFloat m_flRemapSpeedToWallJumpVelocityDist;
	// MPropertyDescription = "Fatigue recovery: How long after the last wall jump does it take to recover a full wall jump. Seconds."
	float32 m_flWallJumpFullPowerRechargeTime; // = 1
	// MPropertyDescription = "Smallest possible fraction of a full wall jump you can perform regardless of really small times since last button press."
	float32 m_flWallJumpPowerMin; // = 0.2
	// MPropertyDescription = "How much does fatigue affect the power of the wall jump. 0.0 = aggressive (full power earlier) 0.5 = linear. 1.0 = gentle (full power later)"
	float32 m_flWallJumpPowerBias; // = 0.2
	// MPropertyDescription = "How much vertical speed do we give the player, before fatigue is applied. Fatigue only applies to vertical speed."
	float32 m_flWallJumpUpSpeed; // = 600
	// MPropertyDescription = "Extra velocity along the wall, either direction, based on wish direction."
	float32 m_flWallJumpMaxLateralSpeed; // = 400
	// MPropertyDescription = "How does the power of 'Wall Jump Max Lateral Speed' fall off with speed along the wall (so that players can't stack this speed forever). X axis is speed along the wall in meters per second (using METERS_PER_INCH). Values from this curve are clamped to 0..1 output. "
	CPiecewiseCurve m_WallJumpLateralSpeedFalloffVsAlongSpeed;
	// MPropertyDescription = "Velocity away from the wall when pressing wish direction toward the wall"
	float32 m_flWallJumpMinOutSpeed; // = 250
	// MPropertyDescription = "Velocity away from the wall when pressing wish direction away from the wall"
	float32 m_flWallJumpMaxOutSpeed; // = 600
	// MPropertyDescription = "Shortly after a wall jump, acceleration back toward the wall is increased. This is the period this exists for. Strength fades over this time to zero."
	float32 m_flWallJumpLateralInputSuppressTime; // = 0.2
	// MPropertyDescription = "Shortly after a wall jump, acceleration back toward the wall is increased. This is the maximum bonus (immediately after the wall jump). "
	float32 m_flWallJumpReturnToWallBonusAccel; // = 600
	// MPropertyStartGroup = "Slide Jump"
	// MPropertyDescription = "Reduce the horizontal velocity of a slowed slide jump by this much."
	float32 m_flSlowedSlideJumpFactor; // = 0.75
};
