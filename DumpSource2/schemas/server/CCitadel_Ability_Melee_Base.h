// MAbilityDynamicValuesSuppressCacheWhileActive
class CCitadel_Ability_Melee_Base : public CCitadelBaseAbility
{
	int32 m_nHitNumber;
	int32 m_nPlayerKillNumber;
	bool m_bUsingThisMelee;
	bool m_bUsingMeleeTagActive;
	bool m_bHitWithThisAttack;
	GameTime_t m_flLastActivateTime;
	GameTime_t m_flNextAttackAllowedTime;
	GameTime_t m_flAttackTriggeredTime;
};
