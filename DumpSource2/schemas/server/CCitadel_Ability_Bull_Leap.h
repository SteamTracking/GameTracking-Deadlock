class CCitadel_Ability_Bull_Leap : public CCitadelBaseAbility
{
	bool m_bBraceParamTriggered;
	float32 m_flBoostYaw;
	VectorWS m_vecCrashPosition;
	Vector m_vecCrashDirection;
	ELeapState_t m_eLeapState;
	GameTime_t m_flStateEnterTime;
	CCitadelAutoScaledTime m_flNextStateTime;
	CCitadelAutoScaledTime m_flBoostEndTime;
	VectorWS m_vPrevPos;
	CUtlVector< CHandle< CBaseEntity > > m_vecDraggedEntities;
	Vector m_vecLastVel;
	VectorWS m_vecCrashDownLastPos;
	bool m_bInputBufferCrash;
};
