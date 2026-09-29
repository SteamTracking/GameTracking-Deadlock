class CCitadel_Ability_ShivDash : public CCitadelBaseShivAbility
{
	VectorWS m_vStartPosition;
	Vector m_vDashDirection;
	bool m_bIsDashing;
	CUtlVector< CEntityIndex > m_vecHitEnemies;
	VectorWS m_vecLastPosition;
	int32 m_nReductionsLeft;
	GameTime_t m_flStuckTime;
};
