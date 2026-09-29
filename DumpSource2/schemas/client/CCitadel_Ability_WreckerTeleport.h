class CCitadel_Ability_WreckerTeleport : public C_CitadelBaseAbility
{
	CHandle< C_BaseEntity > m_hProjectile;
	float32 m_flArrowSpeed;
	GameTime_t m_flSnapAnglesBackTime;
	float32 m_flCastTimeDamage;
	GameTime_t m_flCastTime;
	bool m_bNeedsExplosion;
	VectorWS m_vProjectileRemovedOrigin;
	QAngle m_angCasterAnglesAtCastTime;
	float32 m_flTravelDistance;
};
