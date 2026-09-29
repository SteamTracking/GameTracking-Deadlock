class CCitadel_BreakableProp : public CBaseAnimGraph
{
	CCitadelMinimapComponent m_CCitadelMinimapComponent;
	float32 m_flOverrideInitialSpawnTime;
	float32 m_flOverrideRespawnTime;
	int32 m_nGoldCost;
	CUtlOrderedMap< ECurrencyType, BreakablePropCurrencyReward_t > m_mapCurrencyRewards;
	CUtlVector< CSubclassName< 0 > > m_vecPickupRewards;
	CUtlStringToken m_unAbilityIDToSpawn;
	CHandle< CCitadelPlayerPawn > m_hBreaker;
	int32 m_nMeleeHitsTaken;
};
