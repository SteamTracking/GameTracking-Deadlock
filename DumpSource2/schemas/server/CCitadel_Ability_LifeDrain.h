// MAbilityDynamicValuesSuppressCacheWhileActive
class CCitadel_Ability_LifeDrain : public CCitadelBaseAbility
{
	CUtlVector< CModifierHandleTyped< CCitadelModifier > > m_vecModifiers;
	GameTime_t m_tDrainLifeStopTime;
	GameTime_t m_tSlowStartTime;
	GameTime_t m_tSlowStopTime;
};
