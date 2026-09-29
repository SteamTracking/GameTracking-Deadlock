class CCitadel_Ability_SkyRunner_SwingLine : public C_CitadelBaseAbility
{
	ESwingState_t m_eSwingState;
	GameTime_t m_SwingStartTime;
	GameTime_t m_SwingEndTime;
	VectorWS m_vecSwingPoint;
	VectorWS m_vecCurrentPosition;
	float32 m_flIdealSpringLength;
};
