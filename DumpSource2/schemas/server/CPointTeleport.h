class CPointTeleport : public CServerOnlyPointEntity
{
	VectorWS m_vSaveOrigin;
	QAngle m_vSaveAngles;
	bool m_bTeleportParentedEntities;
	bool m_bTeleportUseCurrentAngle;
};
