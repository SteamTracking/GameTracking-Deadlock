class CCitadel_UtilityUpgrade_RocketBooster : public CCitadel_UtilityUpgrade_RocketBoots
{
	ParticleIndex_t m_nTargetingParticleIndex;
	GameTime_t m_flCastTime;
	bool m_bCrashingDown;
	bool m_bImpulseApplied;
	bool m_bCanCrash;
	bool m_bPlayLandingSound;
	VectorWS m_vecCrashPosition;
	Vector m_vecCrashDirection;
};
