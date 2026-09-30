// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_BurrowVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BurrowStartParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BurrowEndParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BurrowInGroundParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BurrowModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SpinModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strBurrowEndSound;
	// MPropertyStartGroup = "+Burrow Properties"
	float32 m_flChannelEndEnemyPopUpForce; // = 100
	float32 m_flChannelEndEnemyPopUpCylinderHeight; // = 150
	// MPropertyDescription = "Spin Camera Controller that matches the modifier for client"
	CitadelCameraOperationsSequence_t m_cameraSpinStart; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
};
