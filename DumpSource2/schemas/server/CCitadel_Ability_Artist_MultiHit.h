class CCitadel_Ability_Artist_MultiHit : public CCitadelBaseAbility
{
	CCitadelBaseAbility* m_pTriggerAbility;
	CUtlVector< CHandle< CBaseEntity > > m_vecHitEnemies;
	GameTime_t m_tMultiHitEndTime;
	GameTime_t m_tSubCooldownEndTime;
	bool m_bActive;
	int32 m_iCurrentHits;
};
