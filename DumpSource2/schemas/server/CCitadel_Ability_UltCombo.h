class CCitadel_Ability_UltCombo : public CCitadelBaseAbility
{
	CModifierHandleTyped< CCitadelModifier > m_hTargetComboModifier;
	GameTime_t m_flLastAttackTime;
	int32 m_nAttackNum;
	int32 m_iBonusHealth;
	CHandle< CBaseEntity > m_hTarget;
};
