// MNetworkVarNames = "GameTime_t m_flExplodeEndTime"
// MNetworkVarNames = "GameTime_t m_flBuffEndTime"
// MClassHasEntityLimitedDataDesc
class CCitadel_Ability_InfinitySlash : public CCitadelBaseYamatoAbility
{
	// MNetworkEnable
	// MNetworkUserGroup = "LocalPlayerOwnerAndObserversExclusive"
	GameTime_t m_flExplodeEndTime;
	// MNetworkEnable
	// MNetworkUserGroup = "LocalPlayerOwnerAndObserversExclusive"
	GameTime_t m_flBuffEndTime;
};
