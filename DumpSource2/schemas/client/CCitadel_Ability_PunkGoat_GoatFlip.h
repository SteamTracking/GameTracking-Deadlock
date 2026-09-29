class CCitadel_Ability_PunkGoat_GoatFlip : public C_CitadelBaseAbility
{
	PG_RisingRamState m_eState;
	GameTime_t m_tStateStartTime;
	float32 m_flGoingUpTargetElevation;
	float32 m_flGoingUpStartElevation;
};
