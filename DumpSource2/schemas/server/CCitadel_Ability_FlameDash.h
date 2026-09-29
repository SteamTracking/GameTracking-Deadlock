// MAbilityDynamicValuesSuppressCacheWhileActive
class CCitadel_Ability_FlameDash : public CCitadelBaseAbility
{
	CUtlVector< CHandle< CBaseEntity > > m_vecHitEntities;
	CCitadelAutoScaledTime m_flDashEndTime;
	bool m_bIsSpeedBursting;
};
