// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Artist_FlyingLionVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SummonParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplosionParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BounceParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_FlyingModifier;
	CEmbeddedSubclass< CCitadelModifier > m_EnemyDebuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_AllyBuffModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strExplosionSound;
	CSoundEventName m_strBounceSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flFlyAccelerationStrength; // = 500
	float32 m_flMinPitch; // = -90
	float32 m_flMaxPitch; // = 90
	float32 m_flMinGravityScale; // = 0.5
	float32 m_flMaxGravityScale; // = 1
	float32 m_flBounceUpSpeed; // = 50
	float32 m_flBounceMaintainRatio; // = 0.2
	float32 m_flMinDistanceAboveGround; // = 30
};
