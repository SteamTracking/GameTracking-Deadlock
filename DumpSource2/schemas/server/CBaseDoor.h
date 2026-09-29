class CBaseDoor : public CBaseToggle
{
	QAngle m_angMoveEntitySpace;
	Vector m_vecMoveDirParentSpace;
	// MNotSaved
	locksound_t m_ls;
	bool m_bForceClosed;
	bool m_bDoorGroup;
	bool m_bLocked;
	bool m_bIgnoreDebris;
	bool m_bNoNPCs;
	FuncDoorSpawnPos_t m_eSpawnPosition;
	float32 m_flBlockDamage;
	CGameSoundEventName m_NoiseMoving;
	CGameSoundEventName m_NoiseArrived;
	CGameSoundEventName m_NoiseMovingClosed;
	CGameSoundEventName m_NoiseArrivedClosed;
	CUtlSymbolLarge m_ChainTarget;
	CEntityIOOutput m_OnBlockedClosing;
	CEntityIOOutput m_OnBlockedOpening;
	CEntityIOOutput m_OnUnblockedClosing;
	CEntityIOOutput m_OnUnblockedOpening;
	CEntityIOOutput m_OnFullyClosed;
	CEntityIOOutput m_OnFullyOpen;
	CEntityIOOutput m_OnClose;
	CEntityIOOutput m_OnOpen;
	CEntityIOOutput m_OnLockedUse;
	bool m_bLoopMoveSound;
	bool m_bCreateNavObstacle;
	float32 m_flSpeed;
	// MNotSaved
	bool m_isChaining;
	// MNotSaved
	bool m_bIsUsable;
};
