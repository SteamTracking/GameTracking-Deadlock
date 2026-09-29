class CCitadel_Ability_Tengu_AirLift : public CCitadelBaseAbility
{
	CHandle< CBaseEntity > m_hGrabTarget;
	ParticleIndex_t m_nHoldBombEffect;
	EFlightState m_eFlightState;
	bool m_bIsGrabbing;
	bool m_bIsHoldingBomb;
	float32 m_flCurrentSpeed;
};
