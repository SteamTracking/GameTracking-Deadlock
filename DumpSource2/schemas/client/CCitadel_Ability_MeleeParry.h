class CCitadel_Ability_MeleeParry : public C_CitadelBaseAbility
{
	ParticleIndex_t m_nActiveFX;
	GameTime_t m_flParryStartTime;
	bool m_bAttackParried;
	GameTime_t m_flParrySuccessEndTime;
};
