class CCitadel_Ability_Frank_Revive : public CCitadelBaseAbility
{
	bool m_bReviveIsActive;
	GameTime_t m_TimeOfDeath;
	GameTime_t m_TimeOfRevive;
	float32 m_flTotalPendingHeal;
};
