// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Artist_BouncingPotVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_EnemyDebuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	CEmbeddedSubclass< CCitadelModifier > m_GroundAuraModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SilenceModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BounceParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_FireworkExplodeParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_ExplosionSound;
	CSoundEventName m_BounceSound;
	CSoundEventName m_FireworkExplosionSound;
	// MPropertyStartGroup = "Gameplay"
	bool m_bApplySlowOnBounce;
	bool m_bApplySlowOnExplosion;
	bool m_bApplySilenceOnBounce;
	bool m_bApplySilenceOnExplosion;
	bool m_bAlwaysBounceDamage;
	bool m_bTryToMakePond;
	bool m_bDebugPond;
	float32 m_flPondDotThreshold; // = 0.1
	float32 m_flPondLengthThreshold; // = 100
	float32 m_flPondTangentSumThreshold; // = 0.1
	float32 m_flPondRadiusMultiplier; // = 1.1
	float32 m_flClimbHeight;
	float32 m_flStepDownHeight;
	float32 m_flDistanceAboveGround;
	float32 m_flFloatDownRate;
	float32 m_flTraceRadius;
	float32 m_flBounceUpSpeed; // = 0.2
	float32 m_flBounceForwardSpeed; // = 0.2
	float32 m_flBounceForwardRatio; // = 0.5
	float32 m_flLeftRightOffsetPerBounce; // = 50
};
