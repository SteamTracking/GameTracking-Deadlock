class CCitadel_Ability_Artist_Tether : public C_CitadelBaseAbility
{
	bool m_bSuccess;
	GameTime_t m_tLastSuccessfulLookTime;
	CHandle< C_BaseEntity > m_pSelectedTarget;
	int32 m_iPermanentBuffCount;
};
