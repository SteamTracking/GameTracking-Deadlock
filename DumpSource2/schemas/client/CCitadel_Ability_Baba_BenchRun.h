class CCitadel_Ability_Baba_BenchRun : public C_CitadelBaseAbility
{
	bool m_bHoldingJump;
	bool m_bHeldJumpAborted;
	GameTime_t m_flHoldJumpStartTime;
	GameTime_t m_flRideStartTime;
	GameTime_t m_flRideEndTime;
	GameTime_t m_flEndLaunchTime;
	float32 m_flLastChargeJumpFraction;
	bool m_bInMelee;
	bool m_bMeleeIsHeavy;
};
