// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Climb_RopeVData : public CitadelAbilityVData
{
	float32 m_flMinButtonHoldTimeToActivate; // = 0.1
	float32 m_flClimbSpeedUp; // = 9.5
	float32 m_flClimbSpeedDown; // = 16
	float32 m_flClimbSpeedDownMax; // = 20
	float32 m_flClimbDownAccelTime; // = 1
	float32 m_flLatchSpeed; // = 112.5
	float32 m_flAttachOffset;
	float32 m_flMinReconnectTime; // = 0.3
	float32 m_flSideMoveReduction; // = -100
	float32 m_flTopOffset; // = 32
	float32 m_flBottomOffset; // = 64
	float32 m_flTraceRadiusSize; // = 64
	float32 m_flStopTimeToShoot; // = 0.5
	float32 m_flJumpOffVertical; // = 300
	float32 m_flJumpOffHorizontal; // = 300
	float32 m_flDuckOffVertical; // = 100
	float32 m_flDuckOffHorizontal; // = 300
	float32 m_flActivateRange; // = 40
	float32 m_flJumpToRoofRayCheckDist; // = 80
	float32 m_flMinTimeToRoofCheck; // = 0.7
	float32 m_flTimeToHintRefresh; // = 3
	float32 m_iMaxHintCount; // = 5
	float32 m_flClimbRopeSlowDurationOnHit; // = 2
	float32 m_flCameraRotateSpeed; // = 10
	float32 m_flCameraRotateMaxTime; // = 1.5
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ClimbRopeSlowOnHitModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ClimbRopeSlowFromRecentDamageModifier;
};
