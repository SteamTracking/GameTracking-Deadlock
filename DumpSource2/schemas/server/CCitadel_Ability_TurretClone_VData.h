// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_TurretClone_VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_strTurretParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_strSwapParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_TurretModel;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strTurretLoopSound;
	CSoundEventName m_strTurretLoopStartSound;
	CSoundEventName m_strTurretLoopEndSound;
	CSoundEventName m_strTurretShootSound;
	CSoundEventName m_strSwapSound;
	CSoundEventName m_strSwapCloneSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	// MPropertyStartGroup = "Camera"
	CitadelCameraOperationsSequence_t m_cameraSequenceTeleport; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
};
