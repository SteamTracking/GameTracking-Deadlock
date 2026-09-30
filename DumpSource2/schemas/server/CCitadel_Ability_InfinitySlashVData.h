// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_InfinitySlashVData : public CCitadelYamatoBaseVData
{
	float32 m_flRiseSpeed; // = 100
	float32 m_flRiseDuration; // = 2
	float32 m_flSpeedDecayScale; // = 0.1
	float32 m_flExplodeHoldTime; // = 0.25
	float32 m_flExplosionShakeAmplitude; // = 16
	float32 m_flExplosionShakeFrequency; // = 10
	float32 m_flExplosionShakeDuration; // = 0.8
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AOERangeEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AnimCastEffect;
	// MPropertyStartGroup = "Camera"
	CitadelCameraOperationsSequence_t m_cameraSequenceExplosion; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BuffTimerModifier;
};
