// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Artist_InkBrushVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TargetParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PaintingParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AoEPreviewParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_GroundAuraModifier;
	// MPropertyStartGroup = "Gameplay"
	bool m_bEndOnRelease; // = true
	bool m_bRMBDraw;
	float32 m_flTimeBetweenConsumingMarker; // = 0.1
	float32 m_flTraceForwardDistance; // = 10000
	float32 m_flTraceDownDistance; // = 100
	float32 m_flDragRadius; // = 30
	float32 m_flDragSpringStrength; // = 300
	float32 m_flDragDampingStrength; // = 30
	float32 m_flDragMaxSpeed; // = 500
	float32 m_flDragMaxSpeedWhilePainting; // = 500
	int32 m_iMinimumMarkers; // = 5
	float32 m_flLoopPercentCheck; // = 0.2
	float32 m_flDistanceThresholdForLoop; // = 5
	float32 m_flLoopRadiusMultiplier; // = 1.1
	// MPropertyStartGroup = "Camera"
	CitadelCameraOperationsSequence_t m_cameraSequenceSelected; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
};
