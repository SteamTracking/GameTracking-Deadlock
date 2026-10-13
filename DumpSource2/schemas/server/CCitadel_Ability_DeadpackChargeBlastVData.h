// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_DeadpackChargeBlastVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strHomeSound;
	CSoundEventName m_strFireSound;
	CSoundEventName m_strImpactSound;
	CSoundEventName m_strCoatedAppliedSound;
	CSoundEventName m_strCoatedConsumeSound;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_RangeIndicatorParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_RangeCircleIndicator;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_MarkedExplosionParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_StuckMineAuraModifier;
	CEmbeddedSubclass< CCitadelModifier > m_CoatedModifier;
	CEmbeddedSubclass< CCitadelModifier > m_CoatedSlowModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	// MPropertyStartGroup = "Firing"
	CRangeFloat m_flFloatDistanceAboveHead;
	CRangeFloat m_flFloatLeftRightDistance;
	CRangeFloat m_flFloatForwardBackDistance;
	CRangeFloat m_flFloatInitialSpeed;
	float32 m_flHomeDelay;
	float32 m_flHomeInterval;
	float32 m_flShootDelay;
	float32 m_flShootInterval;
	float32 m_flTrackedProjectileSpeed;
	float32 m_flMaxHoldDuration;
	float32 m_flAimDeadzone; // = 32
	// MPropertyStartGroup = "Missile Path"
	// MPropertyDescription = "The voxel route is resampled at this spacing before being scattered."
	float32 m_flPathSegmentLengthMeters;
	// MPropertyDescription = "How far each resampled point is pushed sideways into open space. 0 disables the scatter."
	float32 m_flPathScatterDistanceMeters;
	// MPropertyDescription = "Peak arc height as a fraction of the total travel distance, reached at the halfway point. 0 keeps the path flat."
	float32 m_flPathApexFractionOfDistance;
	// MPropertyDescription = "Ceiling on the arc height no matter how far the missile travels. 0 removes the cap."
	float32 m_flPathApexMaxMeters;
};
