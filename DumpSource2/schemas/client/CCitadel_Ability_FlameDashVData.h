// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_FlameDashVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_FlameDashModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_DashBurstSound;
	CSoundEventName m_ChargeHitSound;
	// MPropertyStartGroup = "Camera"
	CitadelCameraOperationsSequence_t m_cameraSpeedBoost; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
};
