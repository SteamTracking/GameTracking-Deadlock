class CCitadel_Ability_Artist_Tether : public CCitadelBaseAbility
{
	bool m_bSuccess;
	GameTime_t m_tLastSuccessfulLookTime;
	CHandle< CBaseEntity > m_pSelectedTarget;
	int32 m_iPermanentBuffCount;
};
