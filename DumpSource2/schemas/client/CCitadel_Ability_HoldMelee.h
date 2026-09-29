class CCitadel_Ability_HoldMelee : public CCitadel_Ability_Melee_Base
{
	GameTime_t m_flStateStartTime;
	GameTime_t m_flDashStartTime;
	EMeleeHold_AttackState m_eCurrentAttackState;
	EMeleeHold_AttackType m_eCurrentAttackType;
	Vector m_vAirDashDir;
	bool m_bAttackStartedWhileSliding;
	GameTime_t m_flLightChainEndTime;
	int32 m_nLightChainCount;
	bool m_bCreatedChargeEffects;
	QAngle m_angForced;
	Vector m_vGoalDir;
};
