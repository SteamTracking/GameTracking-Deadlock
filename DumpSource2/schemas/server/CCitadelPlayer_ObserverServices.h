class CCitadelPlayer_ObserverServices : public CPlayer_ObserverServices
{
	int32 m_nCurrentObservedTeam;
	CHandle< CBaseEntity > m_hLastObserverTarget;
	CHandle< CBaseEntity > m_hPreviousTeamTarget;
	QAngle m_angTargetCamera;
	VectorWS m_vTargetCameraPos;
};
