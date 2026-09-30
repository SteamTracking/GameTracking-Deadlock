// MHasKV3TransferPolymorphicClassname
class CCitadel_XPOrbVData : public CEntitySubclassVDataBase
{
	bool m_bIsObjective;
	// MPropertyStartGroup = "Sounds"
	// MPropertyDescription = "Played to the player who claimed the orb."
	CSoundEventName m_strOrbClaimed;
	// MPropertyDescription = "Played to the teammates of the player who claimed the orb."
	CSoundEventName m_strOrbClaimedTeammate;
	// MPropertyDescription = "Played to the player when they denied an enemy orb."
	CSoundEventName m_strOrbDenied;
	// MPropertyDescription = "Played to assigned earners when an enemy denied their orb."
	CSoundEventName m_strOrbDeniedPlayer;
	// MPropertyDescription = "Played when the server receives a hit on the orb but is waiting to fully claim it."
	CSoundEventName m_strOrbHitConfirm;
	// MPropertyDescription = "Played when the client hit the orb but it isn't confirmed by the server yet."
	CSoundEventName m_strOrbHitPredicted;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_sOrbModel;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_sPredictedHitLimboGlowParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_sFriendlyHitConfirmParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_sEnemyHitConfirmParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_sFriendlyGlowParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_sEnemyGlowParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_sGoldReceivedParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_sFriendlyOrbDeniedParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_sEnemyOrbDeniedParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_sFriendlyOrbEarnedParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_sEnemyOrbEarnedParticle;
	// MPropertyStartGroup = "Behavior"
	float32 m_flOrbSpawnDelayMin; // = 0.3
	float32 m_flOrbSpawnDelayMax; // = 0.3
	float32 m_flOrbSpawnOffsetZ; // = 48
	float32 m_flOrbSpawnOffsetRandomXYZ;
	float32 m_flGravityScale; // = 0.5
	float32 m_flLateralSpeedMin; // = 30
	float32 m_flLateralSpeedMax; // = 50
	float32 m_flLateralMoveDuration; // = 4
	float32 m_flUpSpeedMin; // = 320
	float32 m_flUpSpeedMax; // = 320
	float32 m_flDownSpeed; // = 50
	float32 m_flBurstSpeedMultiplier; // = 5
	float32 m_flBurstSpeedDuration; // = 0.2
	float32 m_flOscillateFrequency;
	float32 m_flLifeTime; // = 4
	float32 m_flRadius; // = 1
	float32 m_flCollisionRadius; // = 12
	float32 m_flInvulDurationMin; // = 0.46
	float32 m_flInvulDurationMax; // = 0.58
	bool m_bUseKillerPlaneOffsets;
	float32 m_flKillerPlaneOffset; // = 20
	float32 m_flKillerPlaneHorizontalDecayRate; // = 10
	float32 m_flKillerPlaneHorizontalSpeedX; // = 65
	float32 m_flKillerPlaneHorizontalSpeedY; // = 50
	float32 m_flKillerPlaneVerticalSpeed; // = 40
	float32 m_flKillerPlaneSpeedNoise; // = 10
	float32 m_flKillerPlaneLaunchOffset; // = 10
	float32 m_flKillerPlaneLaunchDelay; // = -1
	float32 m_flOrbClaimWindow;
};
