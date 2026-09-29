class CCitadel_Ability_GooGrenade : public CCitadelBaseAbility
{
	CNetworkUtlVectorBase< CHandle< CBaseEntity > > m_vecPuddleModifiers;
	GameTime_t m_LastDetonateTime;
};
