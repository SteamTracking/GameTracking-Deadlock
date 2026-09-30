// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Necro_HauntingSkull_AreaVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PreviewRingParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AreaEffect;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strArmingSound;
	CSoundEventName m_strArmedSound;
	CSoundEventName m_strLoopingSound;
	CSoundEventName m_strHitSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flInitialNormalInfluence; // = 0.2
	float32 m_flInitialRandomVariance; // = 0.3
	float32 m_flSpawnPositionNavMeshSearchRange;
};
