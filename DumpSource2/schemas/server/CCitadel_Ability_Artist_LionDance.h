class CCitadel_Ability_Artist_LionDance : public CCitadelBaseAbility
{
	GameTime_t m_tEndTime;
	GameTime_t m_tNextPulseTime;
	bool m_bActive;
	int32 m_iRemainingShots;
	VectorWS m_vLaunchPosition;
	QAngle m_qLaunchAngle;
	CHandle< CBaseEntity > m_pPointModifier;
};
