class CCitadel_Ability_GuidedArrow : public CCitadelBaseAbility
{
	CHandle< CBaseEntity > m_hProjectile;
	CHandle< CBaseEntity > m_hCameraTarget;
	float32 m_flArrowSpeed;
	GameTime_t m_flSnapAnglesBackTime;
	bool m_bNeedsExplosion;
	CHandle< CCitadel_GuidedArrow_OwlModel > m_hOwl;
	GameTime_t m_flCastTime;
	VectorWS m_vProjectileRemovedOrigin;
	QAngle m_angCasterAnglesAtCastTime;
	float32 m_flTravelDistance;
	bool m_bInKillFlow;
	float32 m_flProjectileTurnVel;
};
