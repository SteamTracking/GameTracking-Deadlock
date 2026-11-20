class CAI_NPCMovementStanceSettings_t
{
	// MPropertySuppressExpr = "m_bEnabled == false"
	CAI_MovementGaitSettings m_slow;
	// MPropertySuppressExpr = "m_bEnabled == false"
	CAI_OptionalMovementGaitSettings m_medium;
	// MPropertySuppressExpr = "m_bEnabled == false"
	CAI_OptionalMovementGaitSettings m_fast;
	// MPropertySuppressExpr = "m_bEnabled == false"
	CAI_OptionalMovementGaitSettings m_veryFast;
	// MPropertyFlattenIntoParentRow
	bool m_bEnabled;
};
