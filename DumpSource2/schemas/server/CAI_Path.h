// MGetKV3ClassDefaults = null
// MHasKV3TransferPolymorphicClassname
class CAI_Path : public IAI_Path
{
	CAI_WaypointList m_Waypoints;
	CRelativeLocation m_vPrevWaypoint;
	CAI_WaypointList m_WaypointsLocal;
	uint32 m_nLocalPathHash;
	AI_PathGoal_t m_goal;
	uint32 m_nSerialNumber;
	AI_TaskFailureCode_t m_nFailureCode;
	CHandle< CBaseEntity > m_hBlockingEntity;
	bool m_bSuppressRepathing;
	bool m_bUnbuilt;
	bool m_bSuccess;
	bool m_bNeedsRebuild;
	bool m_bOwnsCoverLocation;
	bool m_bCanRepathFromGoalMovement;
	CRelativeLocation m_vGoalActualPos_Initial;
	CRelativeLocation m_vGoalBasePos_Initial;
	CRelativeLocation m_vGoalActualPos_ForClipping;
	GameTime_t m_flPathCreationTime;
	NavHull_t m_nNavHullIdx;
};
