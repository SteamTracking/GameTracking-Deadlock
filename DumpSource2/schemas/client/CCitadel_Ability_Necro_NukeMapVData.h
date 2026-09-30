// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Necro_NukeMapVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DamageParticle;
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_DelayedEffectModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strDamageSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flRandomSpawnOffsetPerSummon;
	float32 m_flVerticalOffset; // = 5
	float32 m_flForwardOffset; // = 60
};
