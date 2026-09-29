class CAbility_Drifter_ShadowMark : public C_CitadelBaseAbility
{
	CHandle< C_BaseEntity > m_hTeleportTarget;
	bool m_bTeleported;
	QAngle m_qPostTeleportAngles;
	GameTime_t m_flExpireTime;
	GameTime_t m_flTeleportedTime;
};
