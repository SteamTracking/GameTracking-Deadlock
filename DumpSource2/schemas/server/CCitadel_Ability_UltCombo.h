// MNetworkVarNames = "int m_iBonusHealth"
// MNetworkVarNames = "CHandle< CBaseEntity> m_hTarget"
// MClassHasEntityLimitedDataDesc
class CCitadel_Ability_UltCombo : public CCitadelBaseAbility
{
	CModifierHandleTyped< CCitadelModifier > m_hTargetComboModifier;
	GameTime_t m_flLastAttackTime;
	int32 m_nAttackNum;
	// MNetworkEnable
	int32 m_iBonusHealth;
	// MNetworkEnable
	CHandle< CBaseEntity > m_hTarget;
};
