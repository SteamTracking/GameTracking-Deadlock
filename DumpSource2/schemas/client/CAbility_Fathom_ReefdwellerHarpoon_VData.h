// MHasKV3TransferPolymorphicClassname
class CAbility_Fathom_ReefdwellerHarpoon_VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadel_Modifier_ReefdwellerHarpoon_DetachBuff > m_DetachBuff;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strSwapStarted;
	// MPropertyStartGroup = "Camera"
	CitadelCameraOperationsSequence_t m_cameraSequenceFlying;
	// MPropertyStartGroup = "+Harpoon Properties"
	float32 m_flAirSpeedMax;
	float32 m_flFallSpeedMax; // = 5
	float32 m_flAirDrag; // = 3
	float32 m_flInitialSlowSpeed; // = 1
	float32 m_flInitialSpeedBias; // = 0.8
	float32 m_flMaxSurfacePitch; // = 45
};
