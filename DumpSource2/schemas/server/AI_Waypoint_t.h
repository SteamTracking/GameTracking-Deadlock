class AI_Waypoint_t
{
	VectorWS m_vPos;
	WaypointFlags_t m_fWaypointFlags;
	NavType_t m_nNavType;
	float32 m_flYaw;
	float32 m_flBoundaryDist;
	float32 m_flPathDistToLastWaypoint;
	CHandle< CBaseEntity > m_hPathCorner;
	CHandle< CBaseEntity > m_hData;
	uint32 m_nNavAreaId;
	uint32 m_nNavBlockId;
	uint32 m_nNavAreaIdAfterTransition;
	NavType_t m_nNavTypeAfterTransition;
	NavGravity_t m_gravityOverride;
	bool m_bGravityOverrideSet;
	uint32 m_nConstrainedToMovableMeshId;
	uint8 m_nNavLinkSubMotorId;
};
