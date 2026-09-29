class CCitadelZipLineNode : public CBaseModelEntity
{
	// MNotSaved
	CNetworkUtlVectorBase< CHandle< CCitadelZipLineNode > > m_vecConnections;
	// MNotSaved
	CNetworkUtlVectorBase< int32 > m_vecConnectionDir;
	Vector m_vTangentIn;
	Vector m_vTangentOut;
	float32 m_flCumulativeDistance;
	CUtlSymbolLarge m_strGuardBossName;
	CUtlSymbolLarge m_strGuardBossName2;
	CUtlSymbolLarge m_strGuardBossName3;
	int16 m_iNodeIndex;
	// MNotSaved
	int16 m_eCaptureState;
	int16 m_iPrimaryLane;
	// MNotSaved
	int16 m_nRopesParity;
	bool m_bCornerNode;
	bool m_bCapturable;
	bool m_bDisableZippingToByPlayers;
	float32 m_flSpeedMultiplierToBaseBonus;
	float32 m_flSpeedMultiplierFromBaseBonus;
	// MNotSaved
	CNetworkUtlVectorBase< CHandle< CBaseEntity > > m_hGuardingBosses;
	float32 m_flRopeRadius;
};
