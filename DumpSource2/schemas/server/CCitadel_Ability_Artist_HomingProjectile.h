// MAbilityDynamicValuesSuppressCacheWhileActive
class CCitadel_Ability_Artist_HomingProjectile : public CCitadelBaseAbility
{
	bool m_bDealtStrokeDamageThisTick;
	CNetworkUtlVectorBase< CHandle< CBaseEntity > > m_vecDeployedProjectiles;
	GameTime_t m_tShootingLockoutEndTime;
};
