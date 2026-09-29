class CCitadelPlayer_ObserverServices : public CPlayer_ObserverServices
{
	int32 m_nLastLocalPlayerObservedTeam;
	int32 m_nCurrentObservedTeam;
	CHandle< C_BaseEntity > m_hLastObserverTarget;
	CHandle< C_BaseEntity > m_hPreviousTeamTarget;
	QAngle m_angTargetCamera;
	VectorWS m_vTargetCameraPos;
};
