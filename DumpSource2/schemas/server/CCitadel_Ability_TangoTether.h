class CCitadel_Ability_TangoTether : public CCitadelBaseAbility
{
	int32 m_iTargetPosIndex;
	CHandle< CBaseEntity > m_hLockOnTarget;
	Vector m_vecCastStartPos;
	Vector m_vecDashStartPos;
	Vector m_vecDashEndPos;
	QAngle m_angDashStartAng;
	GameTime_t m_flDashStartTime;
	GameTime_t m_flGrappleStartTime;
	GameTime_t m_flGrappleArriveTime;
	CHandle< CBaseEntity > m_hTarget;
	float32 m_flVelSpring;
	GameTime_t m_flGrappleShotAttackTime;
	int32 m_nTicksNotMoving;
	Vector m_vecPrevPos;
	Vector[20] m_rgTargetPos;
	GameTime_t[20] m_rgTargetPosTime;
	ParticleIndex_t m_nGrappleTravelEffect;
};
