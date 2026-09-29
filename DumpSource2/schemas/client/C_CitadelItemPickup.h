class C_CitadelItemPickup : public CCitadelAnimatingModelEntity
{
	int32 m_eLootType;
	int32 m_nCurrencyValue;
	CUtlSymbolLarge m_iszModelName;
	float32 m_flModelScale;
	CHandle< C_BaseEntity > m_hTargetPlayer;
	float32 m_flFallRate;
};
