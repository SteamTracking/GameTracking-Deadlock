class CCitadel_Ability_Artist_MultiHit : public C_CitadelBaseAbility
{
	C_CitadelBaseAbility* m_pTriggerAbility;
	CUtlVector< CHandle< C_BaseEntity > > m_vecHitEnemies;
	GameTime_t m_tMultiHitEndTime;
	GameTime_t m_tSubCooldownEndTime;
	bool m_bActive;
	int32 m_iCurrentHits;
};
