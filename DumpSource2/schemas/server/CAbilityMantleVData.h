// MHasKV3TransferPolymorphicClassname
class CAbilityMantleVData : public CitadelAbilityVData
{
	CUtlVector< MantleType_t > m_vecMantleTypes;
	// MPropertyStartGroup = "Modifiers"
	float32 m_flMantleSlowOnHitDuration; // = 2
	CEmbeddedSubclass< CCitadelModifier > m_MantleSlowOnHitModifier;
	// MPropertyStartGroup = "Auto-Mantle"
	// MPropertyDescription = "How long a mantleable ledge must stay ahead of you while you keep moving toward it before the Auto-Mantle settings can climb it"
	float32 m_flAutoMantlePushTime; // = 0.06
	// MPropertyDescription = "Auto-mantle only fires on a tick where you moved toward the ledge slower than this (units/sec), i.e. something is actually stopping you. Props and slopes you can walk up onto keep you moving, so they are never auto-mantled"
	float32 m_flAutoMantleBlockedMaxSpeed; // = 60
};
