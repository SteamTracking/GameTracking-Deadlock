class CAbility_Synth_Barrage : public C_CitadelBaseAbility
{
	int32 m_nProjectilesScheduled;
	ParticleIndex_t m_ChannelParticle;
	GameTime_t m_flNextShootTime;
};
