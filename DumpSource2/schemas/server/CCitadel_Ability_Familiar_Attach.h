class CCitadel_Ability_Familiar_Attach : public CCitadelBaseAbility
{
	CNetworkUtlVectorBase< CHandle< CBaseEntity > > m_vecTagAlongVisitedAllies;
	CHandle< CBaseEntity > m_hLastAttachedTo;
};
