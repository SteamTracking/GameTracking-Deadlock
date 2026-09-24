// MNetworkVarNames = "float m_flHeldTime"
// MClassHasEntityLimitedDataDesc
class CCitadel_Ability_GoldenIdol : public CCitadel_Ability_BaseHeldItem
{
	int32 m_nGold;
	int32 m_nTeamBias;
	GameTime_t m_tAbilityCreateTime;
	GameTime_t m_tLastDamageTime;
	VectorWS m_vHomePosition;
	// MNetworkEnable
	// MNetworkUserGroup = "LocalPlayerOwnerAndObserversExclusive"
	float32 m_flHeldTime;
};
