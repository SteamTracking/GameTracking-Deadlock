class CNPC_BaseDefenseSentry : public CNPC_SimpleAnimatingAI
{
	float32 m_flAttackCone;
	// MNotSaved
	float32 m_flAttackDelay;
	// MNotSaved
	GameTime_t m_flLastAlertSound;
	int16 m_nSentryLevel;
	Vector m_vecForward;
};
