// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Baba_HexVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	ModelChange_t m_CursedModel;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TargetParticle;
	// MPropertyDescription = "Plays on the victim for as long as the hex is in effect. Use this rather than the modifier's own particle effect, which would start before the hex lands"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HexedParticle;
	// MPropertyStartGroup = "Camera"
	// MPropertyDescription = "Started on the victim when the hex lands, and stopped when it ends. Use this rather than Sequence Created, which would start before the hex lands"
	CitadelCameraOperationsSequence_t m_cameraSequenceHexed; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
	// MPropertyStartGroup = "+Properties"
	float32 m_flModelScale; // = 1
	bool m_bInterruptsChannels; // = true
	// MPropertyStartGroup = "+Flight"
	bool m_bCanFly;
	float32 m_flFlyAcceleration; // = 1.5
	float32 m_flFlyDeceleration; // = 1.5
	float32 m_flFlySpeedScale; // = 1
	float32 m_flFlyIdleSinkSpeed; // = 40
	float32 m_flLaunchUpSpeed;
	float32 m_flFlyLaunchTime; // = 0.35
	float32 m_flFlyHoverMinHeight; // = 140
	float32 m_flFlyHoverMaxHeight; // = 800
	float32 m_flFlyHoverMinImpulseFlat; // = 90
	float32 m_flFlyHoverMinImpulseScaling; // = 0.2
	float32 m_flFlyHoverMaxScale; // = 0.85
	float32 m_flFlySinkSpeedMax; // = 100
	float32 m_flFlyAirDrag; // = 0.4
	float32 m_flFlyJumpImpulseUp; // = 140
	float32 m_flFlyJumpImpulseHoriz; // = 150
	float32 m_flFlyTimeBetweenJumps; // = 0.6
	float32 m_flFlyTimeBetweenImpulse; // = 0.4
};
