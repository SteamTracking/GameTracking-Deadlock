class CAI_Navigator : public CAI_Component
{
	AI_NavigatorConfig_t m_config;
	CAI_PathCost* m_pPathCost;
	NavType_t m_navType;
	CAI_Path* m_pPath;
	GameTime_t m_flGoalChangeTime;
	GameTime_t m_flTimeLastAvoidanceTriangulate;
	GameTime_t m_flStartWaitingForFacingTime;
	GameTime_t m_gtSpeedAvoidanceTimer;
	AI_NavGoal_t m_queuedGoal;
	AI_NavSetGoalFlags_t m_queuedGoalFlags;
	CAI_Path* m_pQueuedPath;
	CUtlVector< CAI_Navigator::QueuedGoal_t* > m_vecSpeculativeGoals;
	int32 m_nActiveSpeculativePathIndex;
	uint32 m_nPathSerialNumber;
	CAI_Path* m_pMotorQueuedPath;
	AI_NavGoal_t m_motorQueuedGoal;
	bool m_bUpdatingPathQuery;
	AI_NavGoalFlags_t m_nExtraPathQueryGoalFlags;
	CHandle< CBaseEntity > m_hBigStepGroundEnt;
	CHandle< CBaseEntity > m_hLastBlockingEnt;
	int32 m_nPreviousCollisionGroup;
	GameTime_t m_flLastNpcOverlapTime;
};
