// MNetworkVarNames = "float m_flUpFactor"
// MNetworkVarNames = "float m_flBounceVelocity"
// MNetworkVarNames = "GameTime_t m_tDeactivationTime"
// MClassHasEntityLimitedDataDesc
class C_Citadel_Bounce_Pad : public CCitadelAnimatingModelEntity
{
	// MNetworkEnable
	float32 m_flUpFactor;
	// MNetworkEnable
	float32 m_flBounceVelocity;
	// MNetworkEnable
	GameTime_t m_tDeactivationTime;
	bool m_bDeactivated;
	float32 m_flBarrelBounceVelocity;
	float32 m_flBarrelUpFactor;
	bool m_bSpeedOnLand;
	CUtlVector< CHandle< C_BaseEntity > > m_vBouncedPlayerBefore;
};
