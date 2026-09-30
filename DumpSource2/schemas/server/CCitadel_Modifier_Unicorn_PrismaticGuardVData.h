// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Unicorn_PrismaticGuardVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strExplodeSound;
	CSoundEventName m_strDestroyedSound;
	CSoundEventName m_strCrackingSound;
	// MPropertyStartGroup = "Gameplay"
	CITADEL_UNIT_TARGET_TYPE m_eExplosionTargetingType;
	CCitadelProjectileTrackingParams m_TrackingParams; // = { "m_ProjectileSpeedCurve": { "m_spline": [  ], "m_tangents": [  ], "m_vDomainMaxs": [ 0, 0 ], "m_vDomainMins": [ 0, 0 ] }, "m_TrackingAmountCurve": { "m_spline": [  ], "m_tangents": [  ], "m_vDomainMaxs": [ 0, 0 ], "m_vDomainMins": [ 0, 0 ] }, "m_bDisableSolidCollisions": true, "m_flMinTrackingTimeBeforeImpact": 0 }
	float32 m_flVerticalBoost; // = 1
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ShieldParticle;
};
