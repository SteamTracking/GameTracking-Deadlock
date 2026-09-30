// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Doorman_Cart_VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "+Gameplay"
	float32 m_flTraceRadius; // = 10
	float32 m_flDistanceAboveGround; // = 16
	float32 m_flFloatDownRate; // = 10
	float32 m_flClimbHeight; // = 64
	float32 m_flStepDownHeight; // = 64
	float32 m_flMinPitch; // = -90
	float32 m_flMaxPitch; // = 90
	float32 m_flJumpHeight; // = 10
	float32 m_flQAngleSmoothRate; // = 10
	float32 m_flCartSpeedFast; // = 1500
	CPiecewiseCurve m_flGroundHitPitchCurve;
	CPiecewiseCurve m_flGroundHitRollCurve;
	CPiecewiseCurve m_flGroundHitYawCurve;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_ModifierDrag;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_CartExpireSound;
	CSoundEventName m_CartHitSound;
	CSoundEventName m_CartHitAllySound;
	CSoundEventName m_strWallSlamSound;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_FriendlyCastProjectileTrailParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_FriendlyCastProjectileModel;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CartCastParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_WallImpactParticle;
};
