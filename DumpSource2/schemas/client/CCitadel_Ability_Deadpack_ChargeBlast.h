class CCitadel_Ability_Deadpack_ChargeBlast : public C_CitadelBaseAbility
{
	VectorWS m_vStartPoint;
	VectorWS m_vEndPoint;
	Vector m_vAimOffset;
	GameTime_t m_tLaunchHeldBeginTime;
	bool m_bTargetingActive;
};
