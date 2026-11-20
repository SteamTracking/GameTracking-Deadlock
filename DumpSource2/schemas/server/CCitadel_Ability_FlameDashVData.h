// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_FlameDashVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_FlameDashModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_DashBurstSound;
	CSoundEventName m_ChargeHitSound;
	// MPropertyStartGroup = "Camera"
	CitadelCameraOperationsSequence_t m_cameraSpeedBoost;
};
