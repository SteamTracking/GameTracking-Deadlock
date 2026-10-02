// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_RatKing_RatNibbleVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_EnemyModifier;
	CEmbeddedSubclass< CCitadelModifier > m_MarkModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flVerticalBoost;
	float32 m_flRatSpread; // = 10
	float32 m_RatJumpConeLength; // = 150
	float32 m_RatJumpConeAngle; // = 45
	// MPropertyDescription = "Seconds after a rat jumps onto a target before the next rat can jump onto that same target."
	float32 m_flRatJumpDelay; // = 0.2
	float32 m_RatRayRightOffset; // = 40
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
};
