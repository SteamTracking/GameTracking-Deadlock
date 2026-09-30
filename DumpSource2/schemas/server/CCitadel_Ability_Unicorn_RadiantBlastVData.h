// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Unicorn_RadiantBlastVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strHitSound;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HitParticle;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flJumpAirSpeedMax;
	float32 m_flJumpFallSpeedMax;
	float32 m_flJumpAirDrag;
	int32 m_iConeBulletCount; // = 16
	float32 m_flConeBulletSpread; // = 0.95
	float32 m_flRangeScaleIncreaseMax; // = 1.5
	float32 m_flRangeScaleIncreaseMaxSpeed; // = 600
	float32 m_flHitConeAngleExtra; // = 10
};
