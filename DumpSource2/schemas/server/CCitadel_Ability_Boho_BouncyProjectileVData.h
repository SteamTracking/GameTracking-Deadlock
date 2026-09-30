// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Boho_BouncyProjectileVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ImpactParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_TargetCastSound;
	CSoundEventName m_strImpactSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flMinProjectileTravelTime; // = 0.1
	float32 m_flDistanceBiasForCaster; // = 30
	float32 m_flDistanceBiasForHeroes; // = -30
	CPiecewiseCurve m_bouncePositionCurve;
};
