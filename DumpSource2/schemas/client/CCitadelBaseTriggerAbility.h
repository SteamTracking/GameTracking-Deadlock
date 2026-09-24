// MNetworkVarNames = "CHandle< CCitadelBaseAbility> m_hAbilityToTrigger"
// MNetworkVarNames = "GameTime_t m_SwappedToTime"
// MClassHasEntityLimitedDataDesc
class CCitadelBaseTriggerAbility : public C_CitadelBaseAbility
{
	// MNetworkEnable
	// MNetworkUserGroup = "LocalPlayerOwnerAndObserversExclusive"
	CHandle< C_CitadelBaseAbility > m_hAbilityToTrigger;
	// MNetworkEnable
	// MNetworkUserGroup = "LocalPlayerOwnerAndObserversExclusive"
	GameTime_t m_SwappedToTime;
};
