class CAbility_Drifter_ShadowMark : public CCitadelBaseAbility
{
	VectorWS m_vLastValidTeleportPosition;
	CHandle< CBaseEntity > m_hTeleportTarget;
	bool m_bTeleported;
	QAngle m_qPostTeleportAngles;
	GameTime_t m_flExpireTime;
	GameTime_t m_flTeleportedTime;
};
