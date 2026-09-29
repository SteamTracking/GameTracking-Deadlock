class CCitadel_Ability_NanoDash : public C_CitadelBaseAbility
{
	VectorWS m_vStartPosition;
	VectorWS m_vEndPosition;
	bool m_bIsDashing;
	CUtlVector< CEntityIndex > m_vecHitEnemies;
	VectorWS m_vecLastPosition;
	GameTime_t m_flStuckTime;
};
