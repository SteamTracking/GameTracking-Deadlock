// MAbilityDynamicValuesSuppressCacheWhileActive
class CCitadel_Ability_Artist_HomingProjectile : public C_CitadelBaseAbility
{
	bool m_bDealtStrokeDamageThisTick;
	C_NetworkUtlVectorBase< CHandle< C_BaseEntity > > m_vecDeployedProjectiles;
	GameTime_t m_tShootingLockoutEndTime;
};
