class CCitadel_Ability_Artist_LionDance : public C_CitadelBaseAbility
{
	GameTime_t m_tEndTime;
	GameTime_t m_tNextPulseTime;
	bool m_bActive;
	int32 m_iRemainingShots;
	VectorWS m_vLaunchPosition;
	QAngle m_qLaunchAngle;
	CHandle< C_BaseEntity > m_pPointModifier;
};
