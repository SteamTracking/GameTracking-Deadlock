class CCitadel_Ability_Familiar_Attach : public C_CitadelBaseAbility
{
	C_NetworkUtlVectorBase< CHandle< C_BaseEntity > > m_vecTagAlongVisitedAllies;
	CHandle< C_BaseEntity > m_hLastAttachedTo;
};
