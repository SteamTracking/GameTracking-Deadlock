class CCitadel_Ability_GuidedArrow : public C_CitadelBaseAbility
{
	CHandle< C_BaseEntity > m_hProjectile;
	CHandle< C_BaseEntity > m_hCameraTarget;
	float32 m_flArrowSpeed;
	GameTime_t m_flSnapAnglesBackTime;
	GameTime_t m_flCastTime;
	VectorWS m_vProjectileRemovedOrigin;
	QAngle m_angCasterAnglesAtCastTime;
	float32 m_flTravelDistance;
	bool m_bInKillFlow;
	float32 m_flProjectileTurnVel;
};
