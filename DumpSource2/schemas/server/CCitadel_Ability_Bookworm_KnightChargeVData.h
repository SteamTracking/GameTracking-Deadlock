// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Bookworm_KnightChargeVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_KnightChargeChannelParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_KnightChargeCastParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strKnightChargeExplosionSound;
	CSoundEventName m_strCastDelayLocalPlayerSound;
	CSoundEventName m_strExpireSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flNavMeshSearchRange; // = 10
	float32 m_flNavMeshSearchForwardOffset; // = 100
	float32 m_flObstacleAvoidanceAmount; // = 0.1
	float32 m_flGravity; // = -900
	float32 m_flGroundCheckDistance; // = 1000
	float32 m_flGroundSnapDistance; // = 0.1
	float32 m_flJumpSpeed; // = 10
	float32 m_flTimescale; // = 1
	float32 m_flHintRecoveryStrength; // = 0.1
	CPiecewiseCurve m_worldPositionHeightCurveX;
	CPiecewiseCurve m_worldPositionHeightCurveY;
	float32 m_flDestroyLeashDistance; // = 500
	float32 m_flDestroyMapDistance; // = 10000
	float32 m_flQAngleSpringConstant; // = 10
	float32 m_flMiniHopSpeedMin; // = 50
	float32 m_flMiniHopSpeedMax; // = 70
	float32 m_flMinPitch;
	float32 m_flMaxPitch; // = 90
	bool m_bDebug;
};
