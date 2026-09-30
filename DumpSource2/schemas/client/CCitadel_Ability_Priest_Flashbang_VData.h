// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Priest_Flashbang_VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_EnemyDebuffModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BounceParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_ExplosionSound;
	CSoundEventName m_BounceSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flMinSurfaceDotToBounce;
	float32 m_flMaxSurfaceDotToBounce; // = 1
	float32 m_flBounceVerticalReductionRatio; // = 0.5
	bool m_bDebug;
};
