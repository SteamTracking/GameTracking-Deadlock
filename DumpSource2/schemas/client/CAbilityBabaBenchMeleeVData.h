// MHasKV3TransferPolymorphicClassname
class CAbilityBabaBenchMeleeVData : public CitadelAbilityVData
{
	CUtlOrderedMap< EBabaBenchMeleeAttackType, BabaBenchMeleeAttack_t > m_mapAttacks;
	float32 m_flHeavyHoldTime; // = 0.55
	float32 m_flMinChargeTime; // = 0.5
	float32 m_flCollisionDistance; // = 50
	float32 m_flMinDashTime;
	float32 m_flDashMaxTurnRate; // = 140
	CUtlString m_strEffectsAttachName; // = "palm_l"
	// MPropertyStartGroup = "Ground Pound"
	float32 m_flGroundPoundDiveSpeed;
	float32 m_flGroundPoundLaunchSpeed;
	float32 m_flGroundPoundChargeAirControlSpeed;
	float32 m_flGroundPoundChargeAirControlAccel;
	float32 m_flGroundPoundGravityScale; // = 2
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HoldBeginEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_GroundPoundImpactParticle;
	// MPropertyStartGroup = "Camera"
	CitadelCameraOperationsSequence_t m_cameraSequenceHoldStart;
	CitadelCameraOperationsSequence_t m_cameraSequenceHitImpact;
	CitadelCameraOperationsSequence_t m_cameraSequenceMiss;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strHoldBegin;
	CSoundEventName m_strGroundImpactSound;
	CSoundEventName m_strLightKickBeginSound;
};
