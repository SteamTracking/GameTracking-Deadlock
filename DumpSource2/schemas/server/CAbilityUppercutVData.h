// MHasKV3TransferPolymorphicClassname
class CAbilityUppercutVData : public CAbilityMeleeVData
{
	AttackData_t m_UppercutAttackData;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_UppercutModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ClipModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flMaxPitchUp; // = -60
	float32 m_flDamageTriggerTime; // = 0.235
	float32 m_flMeleeLockoutDuration; // = 0.5
};
