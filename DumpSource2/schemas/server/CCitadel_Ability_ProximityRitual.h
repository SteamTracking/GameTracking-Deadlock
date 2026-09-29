class CCitadel_Ability_ProximityRitual : public CCitadelBaseAbility
{
	ECatStatueState_t m_eState;
	CHandle< CBaseEntity > m_hStatue;
	GameTime_t m_tCatRecallTime;
	int32 m_iCatRecallHealth;
	VectorWS m_vLaunchPosition;
	QAngle m_qLaunchAngle;
};
