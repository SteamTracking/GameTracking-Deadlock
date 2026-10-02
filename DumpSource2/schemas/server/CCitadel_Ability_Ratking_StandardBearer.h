class CCitadel_Ability_Ratking_StandardBearer : public CCitadelBaseAbility
{
	GameTime_t m_flForcedPlantTime;
	GameTime_t m_flChargeResumeTime;
	GameTime_t m_flChargeStartTime;
	EPlantLeapPhase_t m_ePlantLeapPhase;
	GameTime_t m_flPlantLeapPhaseStartTime;
	float32 m_flPlantLeapPhaseElapsedAtPause;
	bool m_bLeapLanded;
	Vector m_vPlantDir;
	bool m_bFirstTick;
	Vector m_vGoalDir;
	float32 m_flCurrentChargeSpeed;
	float32 m_flChargeStartSpeed;
};
