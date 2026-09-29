class CCitadel_Ability_Nano_Pounce_Instant : public CCitadelBaseAbility
{
	bool m_bActive;
	CHandle< CBaseEntity > m_hCurrentTarget;
	CHandle< CBaseEntity > m_hLastCastTarget;
	VectorWS m_vStartPosition;
	VectorWS m_vDeparturePosition;
	CCitadelAutoScaledTime m_flDepartureTime;
	CCitadelAutoScaledTime m_flArrivalTime;
	VectorWS m_vLastKnownSafePos;
	bool m_bStartedPhase01;
	bool m_bStartedPhase02;
	bool m_bIsFirstCastCompleted;
	GameTime_t m_tDoubleCastWindow;
	ParticleIndex_t m_CastStartParticle;
};
