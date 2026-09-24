// MNetworkVarNames = "GameTime_t m_flScopeStartTime"
// MNetworkVarNames = "int m_iSnipeKills"
// MClassHasEntityLimitedDataDesc
class CCitadel_Ability_Hornet_Snipe : public C_CitadelBaseAbility
{
	// MNetworkEnable
	// MNetworkUserGroup = "LocalPlayerOwnerAndObserversExclusive"
	GameTime_t m_flScopeStartTime;
	// MNetworkEnable
	// MNetworkUserGroup = "LocalPlayerOwnerAndObserversExclusive"
	int32 m_iSnipeKills;
};
