// MHasKV3TransferPolymorphicClassname
class CAbilityPowerSlashVData : public CCitadelYamatoBaseVData
{
	float32 m_flAirDrag; // = 1
	float32 m_flMaxPowerPadding; // = 0.2
	float32 m_flEffectGroundTrace; // = 32
	float32 m_flWhizbyMaxRange; // = 180
	float32 m_flStartPosTestCapsuleLength; // = 100
	float32 m_flCoverLOSBackDist; // = 100
	// MPropertyDescription = "Visual offset for the origin of the long-slash particle effect"
	Vector m_vecLongEffectOffset;
	float32 m_vecPlayerLeftOffset;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PowerSlashParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PowerSlashFullParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ImpactParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PowerUpParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strStartSound;
	CSoundEventName m_strHitConfirmSound;
	CSoundEventName m_strPowerUp1Sounds;
	CSoundEventName m_strPowerUp2Sounds;
	CSoundEventName m_strPowerUp3Sounds;
	CSoundEventName m_strWhizbySound;
	CSoundEventName m_strSlashSound;
	CSoundEventName m_strSlashFullSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_SlowModifier;
	CEmbeddedSubclass< CCitadelModifier > m_UnstoppableWhileCastingModifier;
};
