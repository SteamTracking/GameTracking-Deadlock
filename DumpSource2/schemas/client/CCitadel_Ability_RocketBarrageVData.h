// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_RocketBarrageVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BarrageModifier;
	CEmbeddedSubclass< CCitadelModifier > m_MoveSlowModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ImpactParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strExplodeSound;
	CSoundEventName m_strBarrageSound;
	CSoundEventName m_strBarrageLoop;
	// MPropertyStartGroup = "Camera"
	CitadelCameraOperationsSequence_t m_cameraSequenceSelected; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
	// MPropertyStartGroup = "+Rocket Barrage Properties"
	float32 m_flMoveSpeedReductionPct; // = 54
	float32 m_flHeightTestDistance; // = 240
};
