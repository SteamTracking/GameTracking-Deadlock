class CFuncMoveLinear : public CBaseToggle
{
	MoveLinearAuthoredPos_t m_authoredPosition;
	QAngle m_angMoveEntitySpace;
	Vector m_vecMoveDirParentSpace;
	CGameSoundEventName m_soundStart;
	CGameSoundEventName m_soundStop;
	CUtlSymbolLarge m_currentSound;
	float32 m_flBlockDamage;
	float32 m_flStartPosition;
	CEntityIOOutput m_OnFullyOpen;
	CEntityIOOutput m_OnFullyClosed;
	float32 m_flSpeed;
	bool m_bCreateMovableNavMesh;
	bool m_bAllowMovableNavMeshDockingOnEntireEntity;
	bool m_bCreateNavObstacle;
};
