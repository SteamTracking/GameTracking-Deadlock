class CCitadel_Ability_TurretClone : public CCitadelBaseAbility
{
	bool m_bHasTurretReady;
	int32 m_iCurrentSwapCount;
	GameTime_t m_flTurretExpireTime;
	CHandle< CCitadel_MagicianTurret > m_pActiveTurret;
	ParticleIndex_t m_nTurretFXIndex;
};
