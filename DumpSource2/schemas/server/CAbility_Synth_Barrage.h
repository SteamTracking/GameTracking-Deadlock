class CAbility_Synth_Barrage : public CCitadelBaseAbility
{
	ShotID_t m_tLastShotID;
	int32 m_nProjectilesScheduled;
	ParticleIndex_t m_ChannelParticle;
	GameTime_t m_flNextShootTime;
};
