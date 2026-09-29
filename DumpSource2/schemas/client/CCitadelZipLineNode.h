class CCitadelZipLineNode : public C_BaseModelEntity
{
	// MNotSaved
	C_NetworkUtlVectorBase< CHandle< CCitadelZipLineNode > > m_vecConnections;
	// MNotSaved
	C_NetworkUtlVectorBase< int32 > m_vecConnectionDir;
	Vector m_vTangentIn;
	Vector m_vTangentOut;
	float32 m_flCumulativeDistance;
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
	C_NetworkUtlVectorBase< CHandle< C_BaseEntity > > m_hGuardingBosses;
	float32 m_flRopeRadius;
};
