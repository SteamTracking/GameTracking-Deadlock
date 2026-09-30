// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Necro_ZombieWallVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_WallParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_WallWarningEffect;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_GroundAuraModifier;
	CEmbeddedSubclass< CCitadelModifier > m_TetherModifier;
	// MPropertyStartGroup = "+Gameplay"
	float32 m_flMiddleStitchDistance; // = 10
	float32 m_flTraceRadius; // = 10
	float32 m_flDistanceAboveGround; // = 16
	float32 m_flFloatDownRate; // = 10
	float32 m_flClimbHeight; // = 64
	float32 m_flStepDownHeight; // = 64
	float32 m_flCurlNoiseFrequency; // = 10
	CPiecewiseCurve m_CurlNoiseStrengthCurve;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strWallHitSound;
	CSoundEventName m_strWallPopSound;
	CSoundEventName m_strWallBeamStartSound;
	CSoundEventName m_strWallBeamStopSound;
	CSoundEventName m_strWallBeamPointStartLoopSound;
	CSoundEventName m_strWallBeamPointEndLoopSound;
	CSoundEventName m_strWallBeamPointClosestLoopSound;
};
