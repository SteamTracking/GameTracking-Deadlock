class CCitadel_Ability_Chessmaster_ThrowBishop : public C_CitadelBaseAbility
{
	C_NetworkUtlVectorBase< CHandle< C_BaseEntity > > m_vecDeployedPieces;
	CHandle< CCitadel_Ability_Chessmaster_MoveChessPiece > m_hMoveAbility;
	bool m_bActive;
	int32 m_iBishopIndex;
	GameTime_t m_tRecastEndTime;
	CUtlVector< CHandle< C_BaseEntity > > m_vecShotBishops;
	CUtlVector< CHandle< C_BaseEntity > > m_vecHitTargets;
	VectorWS m_vecLaunchPosition;
	Vector m_vecLaunchVelocity;
	QAngle m_qLaunchAngle;
};
