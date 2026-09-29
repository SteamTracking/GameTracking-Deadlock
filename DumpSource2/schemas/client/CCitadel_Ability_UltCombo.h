class CCitadel_Ability_UltCombo : public C_CitadelBaseAbility
{
	GameTime_t m_flLastAttackTime;
	int32 m_nAttackNum;
	int32 m_iBonusHealth;
	CHandle< C_BaseEntity > m_hTarget;
};
