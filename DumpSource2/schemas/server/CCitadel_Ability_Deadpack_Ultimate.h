class CCitadel_Ability_Deadpack_Ultimate : public CCitadelBaseAbility
{
	EUltimateState_t m_eState;
	GameTime_t m_tStateTimeBegin;
	VectorWS m_vStateOriginBegin;
	QAngle m_qStateAnglesBegin;
	CHandle< CBaseEntity > m_hTarget;
	float32 m_flGoingUpTargetElevation;
	GameTime_t m_tLastUpwardVelocityTime;
	bool m_bIsApproachingApex;
};
