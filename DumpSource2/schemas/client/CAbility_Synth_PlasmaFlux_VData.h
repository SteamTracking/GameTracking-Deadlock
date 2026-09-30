// MHasKV3TransferPolymorphicClassname
class CAbility_Synth_PlasmaFlux_VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_WeaponDamageBonusModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TeleportTrailParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ImpactParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strCasterLoopingSound;
	CSoundEventName m_strProjectileExpireSound;
	CSoundEventName m_strImpactSound;
	CSoundEventName m_strTimerSound;
	CSoundEventName m_strArrivedSound;
	// MPropertyStartGroup = "Camera"
	CitadelCameraOperationsSequence_t m_cameraSequenceTeleport; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
};
