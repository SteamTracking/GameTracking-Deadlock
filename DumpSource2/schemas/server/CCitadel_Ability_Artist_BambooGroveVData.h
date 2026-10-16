// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Artist_BambooGroveVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_EnemyCastParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BambooModifier;
	CEmbeddedSubclass< CCitadelModifier > m_CenterEnemyModifier;
	CEmbeddedSubclass< CCitadelModifier > m_CenterAllyModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strBambooAppearSound;
	CSoundEventName m_strPreCastSound;
	// MPropertyStartGroup = "Gameplay"
	bool m_bDebug;
	float32 m_flForwardOffset; // = 150
	float32 m_flNoiseFrequency; // = 10
	float32 m_flNoiseStrength; // = 10
	float32 m_flWallTraceMaxDistance; // = 1000
	float32 m_flWallTraceRadius; // = 10
	float32 m_flTimeBetweenDeployments; // = 0.1
};
