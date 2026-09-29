class CCitadel_Ability_FlyingStrike : public CCitadelBaseYamatoAbility
{
	SatVolumeIndex_t m_desatVolIdx;
	bool m_bShadowFormCast;
	VectorWS m_vYamatoCastPos;
	VectorWS m_vTargetCastPos;
	GameTime_t m_flFlyingToTargetStartTime;
	GameTime_t m_flEndAttackTime;
	GameTime_t m_flGrappleStartTime;
	GameTime_t m_flGrappleArriveTime;
	GameTime_t m_flAttackLatchTime;
	VectorWS m_vAttackLatchPos;
	CHandle< C_BaseEntity > m_hTarget;
	bool m_bIsTargetAlly;
	GameTime_t m_flGrappleShotAttackTime;
	VectorWS[20] m_rgPath;
	int32 m_nPathIdx;
	int32 m_nPathSize;
	float32 m_flPathLength;
	Vector m_vFlyingInitialOffsetToPath;
	float32 flDistFlown;
	VectorWS m_vLastSafePos;
	ParticleIndex_t m_nGrappleTravelEffect;
	bool m_bPathDirty;
	bool m_bJumpSoundPlayed;
};
