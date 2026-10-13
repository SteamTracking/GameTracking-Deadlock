class CCitadel_Ability_Deadpack_Ultimate : public C_CitadelBaseAbility
{
	EUltimateState_t m_eState;
	GameTime_t m_tStateTimeBegin;
	VectorWS m_vStateOriginBegin;
	QAngle m_qStateAnglesBegin;
	CHandle< C_BaseEntity > m_hTarget;
	float32 m_flGoingUpTargetElevation;
	GameTime_t m_tLastUpwardVelocityTime;
	bool m_bIsApproachingApex;
};
