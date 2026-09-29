class CNavLinkAreaEntity : public CPointEntity
{
	float32 m_flWidth;
	Vector m_vLocatorOffset;
	QAngle m_qLocatorAnglesOffset;
	VectorWS m_vPrevEntry;
	VectorWS m_vPrevExit;
	CUtlSymbolLarge m_strEndLocatorParentName;
	CHandle< CBaseEntity > m_hEndLocatorParent;
	CRelativeTransform m_endLocator;
	CUtlSymbolLarge m_strMovementForward;
	CUtlSymbolLarge m_strMovementReverse;
	bool m_bEnabled;
	bool m_bAllowCrossMovableConnections;
	bool m_bSuspendConnectionsWhileMoving;
	CUtlSymbolLarge m_strFilterName;
	CHandle< CBaseFilter > m_hFilter;
	CEntityIOOutput m_OnNavLinkStart;
	CEntityIOOutput m_OnNavLinkFinish;
	bool m_bIsTerminus;
	bool m_bIsAutoAdjustForward;
	CUtlVector< CNavLinkConnectionSave > m_vecSavedConnections;
	CUtlVector< CNavLinkAreaEntity::NpcUserList_t > m_vecNpcUsersByNavLink;
	int32 m_nProcessOrder;
	int32 m_nSplits;
};
