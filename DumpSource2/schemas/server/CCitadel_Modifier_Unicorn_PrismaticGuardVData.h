// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Unicorn_PrismaticGuardVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strExplodeSound;
	CSoundEventName m_strDestroyedSound;
	CSoundEventName m_strCrackingSound;
	// MPropertyStartGroup = "Gameplay"
	CITADEL_UNIT_TARGET_TYPE m_eExplosionTargetingType;
	CCitadelProjectileTrackingParams m_TrackingParams;
	float32 m_flVerticalBoost; // = 1
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ShieldParticle;
};
