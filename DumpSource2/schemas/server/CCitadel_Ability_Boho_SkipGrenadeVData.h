// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Boho_SkipGrenadeVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_EnemyDebuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BounceParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_ExplosionSound;
	CSoundEventName m_BounceSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flClimbHeight;
	float32 m_flStepDownHeight;
	float32 m_flDistanceAboveGround;
	float32 m_flFloatDownRate;
	float32 m_flTraceRadius;
	float32 m_flBounceUpSpeed; // = 0.2
	float32 m_flBounceForwardSpeed; // = 0.2
	float32 m_flBounceForwardRatio; // = 0.5
};
