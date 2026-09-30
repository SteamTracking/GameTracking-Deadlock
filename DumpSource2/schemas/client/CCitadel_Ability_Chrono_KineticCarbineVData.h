// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Chrono_KineticCarbineVData : public CitadelAbilityVData
{
	float32 m_flShotTimeScaleLingerDuration; // = 0.1
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ChargingModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	// MPropertyStartGroup = "Camera"
	CitadelCameraOperationsSequence_t m_cameraKineticCarbineShotFired; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strSlowZoomSound;
};
