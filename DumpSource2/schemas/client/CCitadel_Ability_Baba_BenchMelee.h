// MAbilityDynamicValuesSuppressCacheWhileActive
class CCitadel_Ability_Baba_BenchMelee : public C_CitadelBaseAbility
{
	EBabaBenchMeleeState m_eState;
	EBabaBenchMeleeAttackType m_eAttackType;
	GameTime_t m_flStateStartTime;
	GameTime_t m_flCommitTime;
	GameTime_t m_flAttackTriggeredTime;
	GameTime_t m_flNextLightAttackAllowedTime;
	GameTime_t m_flNextHeavyAttackAllowedTime;
	Vector m_vDashDir;
	bool m_bDiveApplied;
	Vector m_vDashStartVelocity;
	bool m_bAttackImpulseApplied;
	QAngle m_angForced;
};
