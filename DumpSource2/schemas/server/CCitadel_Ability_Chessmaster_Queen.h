class CCitadel_Ability_Chessmaster_Queen : public CCitadelBaseAbility
{
	int32 m_iRemainingMoves;
	CUtlVector< CHandle< CBaseEntity > > m_vecHitUnits;
	CUtlVector< CHandle< CBaseEntity > > m_vecStunnedUnits;
	CHandle< CBaseEntity > m_pDeployedQueen;
	bool m_bActive;
};
