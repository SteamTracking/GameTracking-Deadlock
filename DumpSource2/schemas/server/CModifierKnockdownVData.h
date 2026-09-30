// MHasKV3TransferPolymorphicClassname
class CModifierKnockdownVData : public CCitadel_Modifier_StunnedVData
{
	float32 m_flSatVolumeRadius; // = 500
	float32 m_flSatVolumeFadeOut; // = 200
	float32 m_flGravityScale; // = 2
	float32 m_flDesatAmount; // = 1
	Color m_satColorDesat; // = [ 150, 207, 184 ]
	Color m_satColorSat; // = [ 255, 255, 255 ]
	Color m_satColorOutline; // = [ 150, 207, 184 ]
	// MPropertyStartGroup = "Camera"
	float32 m_flGetUpSeqDuration;
	CitadelCameraOperationsSequence_t m_cameraSequenceGetUp; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
};
