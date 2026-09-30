class CAI_MovementGaitSettings
{
	// MPropertySortPriority = 4
	// MPropertyFriendlyName = "Speed Range (optional)"
	// MPropertySuppressExpr = "m_bEnabled == false"
	CRangeFloat m_speedRange;
	// MPropertySortPriority = 3
	// MPropertySuppressExpr = "m_bEnabled == false"
	CRangeFloat m_stopDistanceRange;
	// MPropertySortPriority = 2
	// MPropertySuppressExpr = "m_bEnabled == false"
	CRangeFloat m_hopDistanceRange;
	// MPropertySortPriority = 5
	// MPropertyFriendlyName = "Speed (Preferred)"
	// MPropertySuppressExpr = "m_bEnabled == false"
	float32 m_flPreferredSpeed; // = 75
	// MPropertySortPriority = 1
	// MPropertySuppressExpr = "m_bEnabled == false"
	float32 m_flStartDistance;
	// MPropertySortPriority = 0
	// MPropertyFriendlyName = "Min Turn Radius"
	// MPropertySuppressExpr = "m_bEnabled == false"
	float32 m_flMinTurnRadius;
	// MPropertySortPriority = 6
	// MPropertySuppressExpr = "m_bEnabled == false"
	CBitVecEnum< MovementCapability_t > m_capabilities;
	// MPropertyGroupName = "Additional Settings"
	// MPropertySuppressExpr = "m_bEnabled == false"
	float32 m_flAcceleration; // = 150
	// MPropertyGroupName = "Additional Settings"
	// MPropertySuppressExpr = "m_bEnabled == false"
	float32 m_flDeceleration; // = 500
	// MPropertyGroupName = "Additional Settings"
	// MPropertySuppressExpr = "m_bEnabled == false"
	CPiecewiseCurve m_decelerationCurve; // = { "m_spline": [ { "m_flSlopeIncoming": -0.4, "m_flSlopeOutgoing": -0.4, "x": 0, "y": 1 }, { "m_flSlopeIncoming": -0.4, "m_flSlopeOutgoing": -0.4, "x": 1, "y": 0.6 } ], "m_tangents": [ { "m_nIncomingTangent": "CURVE_TANGENT_SPLINE", "m_nOutgoingTangent": "CURVE_TANGENT_SPLINE" }, { "m_nIncomingTangent": "CURVE_TANGENT_SPLINE", "m_nOutgoingTangent": "CURVE_TANGENT_SPLINE" } ], "m_vDomainMaxs": [ 1, 1 ], "m_vDomainMins": [ 0, 0.6 ] }
	// MPropertyGroupName = "Additional Settings"
	// MPropertySuppressExpr = "m_bEnabled == false"
	float32 m_flProceduralIdleTurnSpeed; // = 180
	// MPropertyGroupName = "Additional Settings"
	// MPropertySuppressExpr = "m_bEnabled == false"
	AI_StrafeMode_t m_eStrafeMode; // = "eContinuous"
	// MPropertyGroupName = "Additional Settings"
	// MPropertySuppressExpr = "m_bEnabled == false"
	// MPropertyDescription = "How far past the halfway point between two discrete strafe angles the target angle has to go before a strafe transition is triggered, when the character is aiming to its left."
	float32 m_flStrafeTransitionAimLeftHysteresis; // = 20
	// MPropertyGroupName = "Additional Settings"
	// MPropertySuppressExpr = "m_bEnabled == false"
	// MPropertyDescription = "How far past the halfway point between two discrete strafe angles the target angle has to go before a strafe transition is triggered, when the character is aiming to its right."
	float32 m_flStrafeTransitionAimRightHysteresis; // = 20
	// MPropertyGroupName = "Additional Settings"
	// MPropertySuppressExpr = "m_bEnabled == false"
	// MPropertyDescription = "Minimum remaining path length required to trigger a strafe transition."
	float32 m_flStrafeTransitionMinPathLength; // = 60
	// MPropertyGroupName = "Additional Settings"
	// MPropertySuppressExpr = "m_bEnabled == false"
	float32 m_flMaxIdleTurnScaleUp; // = 0.2
	// MPropertyGroupName = "Additional Settings"
	// MPropertySuppressExpr = "m_bEnabled == false"
	// MPropertyDescription = "What angle between the current move direction and the direction to the next waypoint will trigger a planted turn. Any value <= 0 will use the sharp angle from the vmdl movement settings."
	float32 m_flMovementPlantedTurnAngleThreshold; // = 120
	// MPropertyGroupName = "Additional Settings"
	// MPropertySuppressExpr = "m_bEnabled == false"
	float32 m_flBashStartDistance;
	// MPropertyGroupName = "Additional Settings"
	// MPropertySuppressExpr = "m_bEnabled == false"
	float32 m_flMinBashDelay; // = 3
	// MPropertyGroupName = "Additional Settings"
	// MPropertySuppressExpr = "m_bEnabled == false"
	CRangeFloat m_flMantleDelayRange; // = [ 1, 4 ]
	// MPropertyGroupName = "Additional Settings"
	// MPropertySuppressExpr = "m_bEnabled == false"
	float32 m_flMantleStartDistance; // = 50
	// MPropertyGroupName = "Additional Settings"
	// MPropertySuppressExpr = "m_bEnabled == false"
	float32 m_flLeanCalculationLookAheadDistance; // = 50
	// MPropertyGroupName = "Additional Settings"
	// MPropertySuppressExpr = "m_bEnabled == false"
	// MPropertyDescription = "How fast will the lean parameter converge to the actual target lean based on the current path curvature. 0 means never while 1 means immediately."
	float32 m_flLeanSmoothingFactor; // = 0.05
	// MPropertyFlattenIntoParentRow
	bool m_bEnabled; // = true
};
