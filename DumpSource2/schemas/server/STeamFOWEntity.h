class STeamFOWEntity
{
	CEntityIndex m_nEntIndex;
	int32 m_nTeam;
	Class_T m_eClass;
	int32 m_iLane;
	EMinimapHeight m_eHeight;
	bool m_bVisibleOnMap;
	bool m_bBackdoorProtectionActive;
	GameTick_t m_nTickHidden;
	CUtlString m_strCSSClass;
	uint8 m_nHealthPercent;
	uint8 m_nPositionX;
	uint8 m_nPositionY;
};
