// MHasKV3TransferPolymorphicClassname
class CCitadelPlayerBotNPCBrainVData : public CAI_CitadelNPCVData
{
	// MPropertyStartGroup = "Movement"
	float32 m_flJumpMaxRise; // = 300
	float32 m_flAirJumpMin; // = 200
	float32 m_flJumpMaxDrop; // = 1024
	float32 m_flJumpMaxDist; // = 200
	float32 m_flJumpMinDist; // = 50
	float32 m_flClimbUpCostBase; // = 32
	float32 m_flClimbUpCostScalar; // = 4
	float32 m_flFaceTargetDistance; // = 1200
	float32 m_flNavGoalTolerance; // = 64
	float32 m_flVerticalAttachOffset; // = 16
	float32 m_flStuckTime; // = 1.5
	float32 m_flStuckTimeAir; // = 3
	float32 m_flMajorStuckTime; // = 30
	int32 m_unMajorStuckAttemptCount; // = 30
	float32 m_flStuckDistance; // = 32
	float32 m_flMaxPathDistance; // = 1300
	float32 m_flMinLanePathDistance; // = 250
	float32 m_flEnemyDistanceForReload; // = 1200
	float32 m_flReloadEnemyFarPct; // = 0.5
	float32 m_flReloadEnemyLoSPct; // = 0.5
	float32 m_flReloadEnemyLosTime; // = 0.5
	float32 m_flMinShootTimeToReload; // = 0.75
	float32 m_flDashDamageThreshold; // = 0.05
	float32 m_flDashDamageTickDown; // = 0.2
	float32 m_flMinDesiredDashDist; // = 200
	float32 m_flMinAbilityAimTime; // = 0.5
	float32 m_flDisengageFromEnemyToLaneDist; // = 1200
	float32 m_flDefendBaseSearchRadius; // = 2000
};
