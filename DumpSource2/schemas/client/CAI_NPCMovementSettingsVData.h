// MVDataRoot
// MVDataOverlayType = 1
class CAI_NPCMovementSettingsVData
{
	// MPropertyAutoExpandSelf
	// MPropertyGroupName = "Default Stance"
	CAI_MovementGaitSettings m_slow;
	// MPropertyAutoExpandSelf
	// MPropertyGroupName = "Default Stance"
	CAI_OptionalMovementGaitSettings m_medium;
	// MPropertyAutoExpandSelf
	// MPropertyGroupName = "Default Stance"
	CAI_OptionalMovementGaitSettings m_fast;
	// MPropertyAutoExpandSelf
	// MPropertyGroupName = "Default Stance"
	CAI_OptionalMovementGaitSettings m_veryFast;
	// MPropertyAutoExpandSelf
	CAI_NPCMovementStanceSettings_t m_crouchStance;
	// MPropertyAutoExpandSelf
	CAI_NPCMovementStanceSettings_t m_proneStance;
	CUtlVector< AI_MovementPoseTransition_t > m_vecPoseTransitions;
	AI_CommonMovementSettings_t m_commonSettings;
};
