// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Ratking_ScrapGrenadeVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BigExplosionSlowModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strExplodeSound;
	CSoundEventName m_strBigExplodeSound;
	CSoundEventName m_BounceSound;
	CSoundEventName m_strTimerSound;
	CSoundEventName m_strExtraTimerSound;
	CSoundEventName m_strMeleeHitSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flBounceVerticalDampening;
	float32 m_flBounceDirectionalDampening;
	float32 m_flMinBounceSpeed; // = 150
	float32 m_flMinSurfaceDotToBounce;
	float32 m_flMaxSurfaceDotToBounce;
	float32 m_flBounceTargetingPlayerWeight; // = 5
	float32 m_flBounceUpMagnitude; // = 1.8
	float32 m_flMinTimeBetweenExplosions; // = 0.7
	float32 m_flBounceTargetDistanceCheck; // = 2000
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ShrapnelTracer;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BounceParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ConeParticle;
};
