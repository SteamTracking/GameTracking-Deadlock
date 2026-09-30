// MHasKV3TransferPolymorphicClassname
class CCitadel_Neutral_Attack_BulletToPointModifierVData : public CModifierNeutralAbilityVData
{
	// MPropertyStartGroup = "Gameplay"
	int32 m_nBulletCount; // = 3
	float32 m_flFireRate; // = 0.5
	float32 m_flTargetPosRNG;
	float32 m_flTargetOffsetPerShot;
	float32 m_flBulletSpeed; // = 1000
	float32 m_flNoTargetDistance; // = 400
	// MPropertySuppressExpr = "m_flHangTime == 0"
	// MPropertyDescription = "Gravity scale for the lob. 1.0 matches world gravity; higher is a steeper arc."
	float32 m_flLobGravityScale; // = 1
	// MPropertyDescription = "Seconds from launch to impact. Drives the arc height."
	float32 m_flHangTime;
	// MPropertyStartGroup = "Modifiers"
	float32 m_flModifierDuration; // = 4
	CEmbeddedSubclass< CCitadelModifier > m_GroundPointModifier;
	// MPropertyStartGroup = "Visuals"
	float32 m_flImpactEffectRadius; // = 4
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ImpactParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TracerParticle;
	// MPropertyDescription = "Fired once per shot at the launch position, alongside the tracer."
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_MuzzleFlashParticle;
	// MPropertyDescription = "Name of particle control point config to use (empty means default)"
	CUtlString m_strMuzzleFlashParticleConfig;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_ShootSound;
	CSoundEventName m_HitSound;
};
