class CCitadel_Ability_Werewolf_Leap : public CCitadelBaseAbility
{
	bool m_bWillLeapOff;
	bool m_bIsLeaping;
	GameTime_t m_tLeapStartTime;
	GameTime_t m_tLeapOffTime;
	VectorWS m_vLaunchPosition;
	Vector m_vLaunchVelocity;
	QAngle m_qLaunchAngle;
};
