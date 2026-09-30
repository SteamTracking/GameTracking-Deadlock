// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_IcePathVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_IcePathModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flMomentumDecayRate; // = 1
	float32 m_flMomentumWeight; // = 0.8
	float32 m_flMaxPitchChange; // = 5
	float32 m_flMaxPitchUp; // = 15
	float32 m_flMaxPitchDown; // = 15
	float32 m_flMaxHeight; // = 1400
	float32 m_flForwardAngleBias; // = -10
};
