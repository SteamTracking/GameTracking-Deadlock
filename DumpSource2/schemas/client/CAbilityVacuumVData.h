// MHasKV3TransferPolymorphicClassname
class CAbilityVacuumVData : public CitadelAbilityVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_VacuumAuraModifier;
	// MPropertyStartGroup = "+Vacuum Properties"
	float32 m_flAirSpeedMax;
	float32 m_flFallSpeedMax; // = 5
	float32 m_flAirDrag; // = 3
	float32 m_flMaxMovespeed; // = 80
};
