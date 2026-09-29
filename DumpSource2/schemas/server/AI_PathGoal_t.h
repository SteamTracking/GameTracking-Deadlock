// MGetKV3ClassDefaults = null
// MHasKV3TransferPolymorphicClassname
class AI_PathGoal_t : public CNavGoalConstraints
{
	AI_NavGoalFlags_t m_goalFlags;
	float32 m_flWaypointSuccessRadius;
	float32 m_flArrivalFlyingSpeedScale;
	float32 m_flPathEndDistanceFromGoal;
	float32 m_flPathEndDistanceFromGoal_Repathing;
	CRelativeLocation m_goalLocation;
	CHandle< CBaseEntity > m_hGoalEntity;
	float32 m_flGoalSuccessRadiusWhenBlocked;
	float32 m_flGoalSuccessRadius;
	AI_ArrivalDirection_t m_vArrivalDirection;
	bool m_bSmoothArrival;
};
