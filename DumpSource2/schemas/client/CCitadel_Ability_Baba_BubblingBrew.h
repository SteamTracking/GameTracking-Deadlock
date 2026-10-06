class CCitadel_Ability_Baba_BubblingBrew : public C_CitadelBaseAbility
{
	CCitadel_Ability_Baba_BubblingBrew::EState m_eState;
	int32 m_CurrentStacks;
	GameTime_t m_tStackExpiryTime;
};
