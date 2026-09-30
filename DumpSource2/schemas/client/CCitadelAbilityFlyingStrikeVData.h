// MHasKV3TransferPolymorphicClassname
class CCitadelAbilityFlyingStrikeVData : public CCitadelYamatoBaseVData
{
	// MPropertyStartGroup = "+Cast Properties"
	float32 m_flJumpFallSpeedMax;
	float32 m_flJumpAirDrag;
	float32 m_flJumpAirSpeedMax; // = 10
	// MPropertyStartGroup = "+Flying to Target Properties"
	// MPropertyDescription = "When cancelling flying strike while flying, how much extra vertical speed to add"
	float32 m_flOnCancelVerticalSpeedBonus; // = 100
	float32 m_flFlyingCloseEnoughToTarget; // = 50
	CPiecewiseCurve m_curveSpeedScale;
	// MPropertyStartGroup = "+Attack Properties"
	float32 m_flAnimToStrikePointTime; // = 0.5
	float32 m_flAnimToStrikeArrivalBias; // = 0.7
	// MPropertyStartGroup = "+Grapple Properties"
	float32 m_flGrappleShotFloatTime; // = 0.5
	float32 m_flGrappleShotDelayToFlyOnHit; // = 0.5
	float32 m_flGrappleSpeed; // = 2000
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_SlowModifier;
	CEmbeddedSubclass< CBaseModifier > m_GrappleTargetModifier;
	CEmbeddedSubclass< CBaseModifier > m_BuffModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_LeapParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ImpactParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SlashParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BulletGrappleTracerParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_EnemyGrappleParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strStartFlyingToTarget;
	CSoundEventName m_strStartAttack;
	CSoundEventName m_strGrappleHitTarget;
	CSoundEventName m_strGrappleLoop;
	CSoundEventName m_strFlyingLoop;
	// MPropertyStartGroup = "Camera"
	CitadelCameraOperationsSequence_t m_cameraSequenceFlying; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
	CitadelCameraOperationsSequence_t m_cameraSequenceAttacking; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
};
