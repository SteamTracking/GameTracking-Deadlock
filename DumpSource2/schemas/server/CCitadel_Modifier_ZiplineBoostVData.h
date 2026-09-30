// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_ZiplineBoostVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Gameplay"
	float32 m_flRampUpTime; // = 3
	float32 m_flPercentageSpeedIncreaseRampFrom;
	float32 m_flPercentageSpeedIncreaseRampTo; // = 60
	// MPropertyStartGroup = "Camera"
	CitadelCameraOperationsSequence_t m_cameraSequenceStartBoost; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
};
