enum AI_MotorGroundAnimGraph_StateType_t : uint32_t
{
	// MPropertyFriendlyName = "Idle"
	eIdle = 0,
	// MPropertyFriendlyName = "Idle Turn"
	eIdleTurn = 1,
	// MPropertyFriendlyName = "Start"
	eStart = 2,
	// MPropertyFriendlyName = "Loop"
	eLoop = 3,
	// MPropertyFriendlyName = "Stop"
	eStop = 4,
	// MPropertyFriendlyName = "Instant Stop"
	eInstantStop = 5,
	// MPropertyFriendlyName = "Hop"
	eHop = 6,
	// MPropertyFriendlyName = "Planted Turn"
	ePlantedTurn = 7,
	// MPropertyFriendlyName = "Custom"
	eCustom = 8,
	// MPropertyFriendlyName = "Custom Mantle"
	eCustomMantle = 9,
	// MPropertyFriendlyName = "Pose Transition"
	ePoseTransition = 10,
	// MPropertyFriendlyName = "Other"
	eOther = 11,
	// MPropertyFriendlyName = "Strafe Transition"
	eStrafeTransition = 12,
	eInvalid = 13,
	eCount = 13,
};
