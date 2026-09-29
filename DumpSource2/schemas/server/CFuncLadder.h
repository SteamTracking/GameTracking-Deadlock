class CFuncLadder : public CBaseModelEntity
{
	Vector m_vecLadderDir;
	// MNotSaved
	CUtlVector< CHandle< CInfoLadderDismount > > m_Dismounts;
	Vector m_vecLocalTop;
	VectorWS m_vecPlayerMountPositionTop;
	VectorWS m_vecPlayerMountPositionBottom;
	float32 m_flAutoRideSpeed;
	bool m_bDisabled;
	bool m_bFakeLadder;
	bool m_bHasSlack;
	CUtlSymbolLarge m_surfacePropName;
	CEntityIOOutput m_OnPlayerGotOnLadder;
	CEntityIOOutput m_OnPlayerGotOffLadder;
};
