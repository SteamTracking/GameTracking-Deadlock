// MNetworkVarNames = "float m_flUpFactor"
// MNetworkVarNames = "float m_flBounceVelocity"
// MNetworkVarNames = "GameTime_t m_tDeactivationTime"
// MClassHasEntityLimitedDataDesc
class CCitadel_Bounce_Pad : public CCitadelAnimatingModelEntity
{
	CHandle< CCitadelBaseAbility > m_hAbility;
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
	CUtlVector< CHandle< CBaseEntity > > m_vBouncedPlayerBefore;
};
