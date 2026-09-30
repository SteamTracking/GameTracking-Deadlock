// MHasKV3TransferPolymorphicClassname
class CAbilityViscousBowlingVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TransformStartFx;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeFX;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_WallImpactFx;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BallTrailFx;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_GroundImpactParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_JumpParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DirectionParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_BallJumpSound;
	CSoundEventName m_EnterBallSound;
	CSoundEventName m_BallLoopSound;
	CSoundEventName m_ExitBallSound;
	CSoundEventName m_WallImpactSound;
	CSoundEventName m_PlayerImpactSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ImpactModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DamagePreventionModifier;
	CEmbeddedSubclass< CCitadelModifier > m_RollingModifier;
	// MPropertyStartGroup = "+Ball Parameters"
	float32 m_flTransformToBallTime;
	float32 m_flTransformFromBallTime;
	float32 m_flAirTurnRatio; // = 40
	float32 m_flWallTurnRatioMax; // = 800
	float32 m_flWallTurnRatioMin; // = 500
	float32 m_flTurnRatio; // = 75
	float32 m_flDefaultBallSpeed; // = 550
	float32 m_flFastBallSpeed; // = 800
	float32 m_flSpeedAccel; // = 800
	float32 m_flSpeedDeccel; // = 300
	float32 m_flElasticity; // = 1
	float32 m_flWallCheckGroundOffset; // = 50
	float32 m_flWallPauseTime; // = 0.3
	float32 m_flWallAngleMin; // = 120
};
