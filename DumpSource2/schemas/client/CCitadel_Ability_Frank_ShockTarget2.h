class CCitadel_Ability_Frank_ShockTarget2 : public C_CitadelBaseAbility
{
	CUtlVector< CHandle< C_BaseEntity > > m_vecHitTargets;
	bool m_bIsFullyCharged;
	CModifierHandleBase m_hFullyChargedFXModifier;
};
