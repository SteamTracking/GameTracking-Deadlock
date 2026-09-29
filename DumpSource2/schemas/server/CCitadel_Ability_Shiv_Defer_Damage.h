class CCitadel_Ability_Shiv_Defer_Damage : public CCitadelBaseShivAbility
{
	float32 m_flTotalPendingDamage;
	GameTime_t m_flLastDeferredDamageApplicationTime;
};
