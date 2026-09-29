class CCitadel_Ability_LashDownStrike : public C_CitadelBaseAbility
{
	GameTime_t m_ImpactTime;
	VectorWS m_vDamagePos;
	ParticleIndex_t m_PreviewEffect;
	ParticleIndex_t m_ActiveEffect;
	bool m_bIsCrashingDown;
	Vector m_vStrikeVel;
	float32 m_flInitialYaw;
	float32 m_flStartHeight;
};
