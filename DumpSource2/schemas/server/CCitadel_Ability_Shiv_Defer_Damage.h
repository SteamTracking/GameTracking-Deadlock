// MNetworkVarNames = "float m_flTotalPendingDamage"
// MClassHasEntityLimitedDataDesc
class CCitadel_Ability_Shiv_Defer_Damage : public CCitadelBaseShivAbility
{
	// MNetworkEnable
	// MNetworkUserGroup = "LocalPlayerOwnerAndObserversExclusive"
	float32 m_flTotalPendingDamage;
	GameTime_t m_flLastDeferredDamageApplicationTime;
};
