class CCitadelCatapultTrigger : public C_BaseTrigger
{
	VectorWS m_vLaunchTarget;
	float32 m_flLaunchSpeed;
	CUtlSymbolLarge m_nameTarget;
	bool m_bPickupTrailEnabled;
	CUtlSymbolLarge m_iszTrailPickupSubclass;
	int32 m_nTrailPickupCount;
	float32 m_flTrailStartDelay;
	float32 m_flTrailSpawnInterval;
	bool m_bTrailAutoSpace;
	float32 m_flTrailTrajectoryTimeSpacing;
};
