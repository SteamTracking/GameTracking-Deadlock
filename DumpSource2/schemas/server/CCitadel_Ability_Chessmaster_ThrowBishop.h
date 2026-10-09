class CCitadel_Ability_Chessmaster_ThrowBishop : public CCitadelBaseAbility
{
	CNetworkUtlVectorBase< CHandle< CBaseEntity > > m_vecDeployedPieces;
	bool m_bActive;
	int32 m_iBishopIndex;
	GameTime_t m_tRecastEndTime;
	CUtlVector< CHandle< CBaseEntity > > m_vecShotBishops;
	CUtlVector< CHandle< CBaseEntity > > m_vecHitTargets;
	VectorWS m_vecLaunchPosition;
	Vector m_vecLaunchVelocity;
	QAngle m_qLaunchAngle;
};
