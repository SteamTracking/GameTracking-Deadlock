class CCitadel_Ability_Mirage_Teleport : public C_CitadelBaseAbility
{
	CHandle< C_BaseEntity > m_hTarget;
	GameTime_t m_tTeleportCompletedTime;
	GameTime_t m_tLastLandedTime;
	VectorWS m_vTargetPosition;
	QAngle m_vTargetAngles;
};
