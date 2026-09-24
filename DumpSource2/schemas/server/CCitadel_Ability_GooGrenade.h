// MNetworkVarNames = "EHANDLE m_vecPuddleModifiers"
// MClassHasEntityLimitedDataDesc
class CCitadel_Ability_GooGrenade : public CCitadelBaseAbility
{
	// MNetworkEnable
	CNetworkUtlVectorBase< CHandle< CBaseEntity > > m_vecPuddleModifiers;
	GameTime_t m_LastDetonateTime;
};
