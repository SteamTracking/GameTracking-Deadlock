// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Doorman_Doorway_VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_DoorOpenStartSound;
	CSoundEventName m_DoorOpenEndSound;
	CSoundEventName m_DoorPlaceSound;
	CSoundEventName m_DoorPlacementClearedSound;
	CSoundEventName m_DoorStartCastSound;
	CSoundEventName m_DoorEndCastSound;
	CSoundEventName m_DoorExpireSound;
	CSoundEventName m_DoorLoopSound;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PendingDoorParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PlaceDoorParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DoorDurationParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DoorDestructionParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_hDoorModel;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_hPortalModel;
	// MPropertyStartGroup = "UI"
	CPanoramaImageName m_strSingleDoorAbilityImage;
	// MPropertyFriendlyName = "Door Spawn Particle Color"
	// MPropertyDescription = "Door Spawn Particle Color"
	Color m_ColorStart;
	// MPropertyFriendlyName = "Door End Particle Color"
	// MPropertyDescription = "Door End Particle Color"
	Color m_ColorEnd;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DoorwayTimerModifier;
	CEmbeddedSubclass< CCitadelModifier > m_PortalBarrierModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flPlacementWallTestDistance; // = 50
	float32 m_flPlacementWallTestExtentsSolidScale; // = 0.9
	float32 m_flPlacementWallTestExtentsWallScale; // = 0.6
	float32 m_flPlacementWallTestSphereRadius; // = 5
	Vector m_vPlacementOffset; // = [ 0, 0, -0.5 ]
	float32 m_flPlacementCooldown; // = 0.4
	float32 m_flPlacementRangeHintDuration; // = 2
	float32 m_flPlacementSphereMaxDesat; // = 1
	Color m_colorPlacementSphereSat;
	Color m_colorPlacementSphereDesat;
	Color m_colorPlacementSphereOutline;
	CPiecewiseCurve m_curvePlacementFail;
};
