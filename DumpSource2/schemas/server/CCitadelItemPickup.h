class CCitadelItemPickup : public CCitadelAnimatingModelEntity
{
	CCitadelMinimapComponent m_CCitadelMinimapComponent;
	int32 m_eLootType;
	int32 m_nCurrencyValue;
	CUtlSymbolLarge m_iszModelName;
	float32 m_flModelScale;
	CHandle< CBaseEntity > m_hTargetPlayer;
	float32 m_flFallRate;
	EObjectivePositions_t m_eObjectivePosition;
	bool m_bRequireGroundForPickup;
	// MNotSaved
	bool m_bOnGround;
	int32 m_nKillingTeamNumber;
	VectorWS m_vHomePosition;
	VectorWS m_vDropPosition;
	GameTime_t m_tFirstPickupTime;
	bool m_bPlaySpawnMusic;
};
