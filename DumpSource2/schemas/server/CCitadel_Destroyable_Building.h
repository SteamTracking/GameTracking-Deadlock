class CCitadel_Destroyable_Building : public CCitadelAnimatingModelEntity
{
	CCitadelMinimapComponent m_CCitadelMinimapComponent;
	CEntityIOOutput m_OnDestroyed;
	CEntityIOOutput m_OnRevitilized;
	CEntityOutputTemplate< float32 > m_OnDamageTaken;
	CEntityOutputTemplate< float32 > m_OnLifeChanged;
	CEntityIOOutput m_OnBecomeActive;
	CEntityIOOutput m_OnBecomeInvulnerable;
	CEntityIOOutput m_OnBecomeVulnerable;
	CEntityIOOutput m_OnUnderAttack;
	CEntityIOOutput m_OnAttackSubsided;
	int32 m_nBuildingHealth;
	int32 m_iLane;
	// MNotSaved
	GameTime_t m_flDestroyedTime;
	// MNotSaved
	GameTime_t m_flLastDamagedTime;
	// MNotSaved
	QAngle m_angOriginal;
	CUtlSymbolLarge m_backdoorProtectionTrigger;
	CUtlSymbolLarge m_strTrooperApproach;
	CCitadelAbilityComponent m_CCitadelAbilityComponent;
	// MNotSaved
	CUtlVectorEmbeddedNetworkVar< WeakPoint_t > m_vecWeakPoints;
	// MNotSaved
	bool m_bDestroyed;
	// MNotSaved
	bool m_bActive;
	bool m_bFinal;
};
