// MHasKV3TransferPolymorphicClassname
class CAI_NPC_Ratking_RatVData : public CEntitySubclassVDataBase
{
	// MPropertyDescription = "How fast we run along our path, in meters per second."
	float32 m_flMoveSpeedMin; // = 14
	float32 m_flMoveSpeedMax; // = 20
	// MPropertyDescription = "How far along our ray we aim ahead of ourselves."
	float32 m_flRayLookahead; // = 96
	// MPropertyDescription = "How much we dislike ending up off our ray. Steers them back to the ray."
	float32 m_flRayDriftPenalty; // = 1
	// MPropertyDescription = "How long we take to peel out into the lane the spread_offset spawn key gave us."
	float32 m_flSpreadDuration; // = 1.5
	// MPropertyDescription = "Score bonus for carrying on in the direction we last picked, so near-equal choices don't fight each other and make us zig-zag."
	float32 m_flDirectionStickiness; // = 8
	// MPropertyDescription = "Max turn rate"
	float32 m_flTurnRate; // = 360
	// MPropertyDescription = "How much of our speed we keep while turning as hard as we can. "
	float32 m_flTurnSpeedFraction; // = 1
	// MPropertyDescription = "How far we weave to either side as we scurry in units"
	float32 m_flScurryAmplitudeMin; // = 6
	float32 m_flScurryAmplitudeMax; // = 8
	// MPropertyDescription = "How long one full left-right-and-back weave takes in seconds."
	float32 m_flScurryPeriodMin; // = 6
	float32 m_flScurryPeriodMax; // = 8
	// MPropertyDescription = "How far ahead we trace the navmesh when looking for somewhere to run."
	float32 m_flProbeDistance; // = 192
	// MPropertyDescription = "How often we check the navmesh."
	float32 m_flProbeInterval; // = 0.2
	// MPropertyDescription = "How high a step up we'll take"
	float32 m_flProbeStepUp; // = 18
	// MPropertyDescription = "How far we will step down"
	float32 m_flProbeStepDown; // = 32
	bool m_bDebugDraw; // = true
	bool m_bDebugDrawEvents;
	float32 m_flDebugEventDuration; // = 5
	float32 m_flModelScaleMin; // = 1.8
	float32 m_flModelScaleMax; // = 2.8
	// MPropertyStartGroup = "Anims"
	CUtlVector< CUtlString > m_AnimRunSequences;
	CUtlString m_AnimFlightSequence;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_RatModel;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_RatSwarmParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strMovementLoopingSound;
};
