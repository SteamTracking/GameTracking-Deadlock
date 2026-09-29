class CCitadel_Modifier_DazzlingOrbWatcher : public CCitadelModifier
{
	ShotID_t m_nAssociatedShotID;
	CHandle< C_BaseEntity > m_hAssociatedProjectile;
	GameTime_t m_flLastHitTime;
	CHandle< C_BaseEntity > m_hLastHitTarget;
	VectorWS m_vLastHitLocation;
	int32 m_nBouncesRemaining;
	GameTime_t m_flLingerEndTime;
	float32 m_flDamageAtCast;
	float32 m_flSlowDurationAtCast;
	float32 m_flBounceRadiusAtCast;
	ParticleIndex_t m_nGraceParticleIndex;
};
