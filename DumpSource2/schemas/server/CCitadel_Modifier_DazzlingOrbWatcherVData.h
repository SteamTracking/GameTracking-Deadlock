// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_DazzlingOrbWatcherVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	CEmbeddedSubclass< CCitadelModifier > m_NextTargetModifier;
	CEmbeddedSubclass< CCitadelModifier > m_OrbFriendlyBounceWatcherModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strExplodeSound;
	CSoundEventName m_strFinalExplodeSound;
	CSoundEventName m_strWorldHitSound;
	CSoundEventName m_strGraceLoopSound;
	CSoundEventName m_strExpireSound;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BounceParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_GraceParticle;
	// MPropertyStartGroup = "Gameplay"
	CPiecewiseCurve m_BouncePositionCurve;
	float32 m_flMinProjectileTravelTime;
	CCitadelProjectileTrackingParams m_TrackingParams; // = { "m_ProjectileSpeedCurve": { "m_spline": [  ], "m_tangents": [  ], "m_vDomainMaxs": [ 0, 0 ], "m_vDomainMins": [ 0, 0 ] }, "m_TrackingAmountCurve": { "m_spline": [  ], "m_tangents": [  ], "m_vDomainMaxs": [ 0, 0 ], "m_vDomainMins": [ 0, 0 ] }, "m_bDisableSolidCollisions": true, "m_flMinTrackingTimeBeforeImpact": 0 }
};
