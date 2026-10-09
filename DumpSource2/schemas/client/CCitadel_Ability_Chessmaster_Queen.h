class CCitadel_Ability_Chessmaster_Queen : public C_CitadelBaseAbility
{
	CHandle< CCitadel_Ability_Chessmaster_MoveChessPiece > m_hMoveAbility;
	int32 m_iRemainingMoves;
	CUtlVector< CHandle< C_BaseEntity > > m_vecHitUnits;
	CUtlVector< CHandle< C_BaseEntity > > m_vecStunnedUnits;
	CHandle< C_BaseEntity > m_pDeployedQueen;
	bool m_bActive;
};
