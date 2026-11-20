// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Gunslinger_DemonCarbineVData : public CitadelAbilityVData
{
	float32 m_flShotTimeScaleLingerDuration; // = 0.1
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ChargingModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	// MPropertyStartGroup = "Camera"
	CitadelCameraOperationsSequence_t m_cameraDemonCarbineShotFired;
};
