// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Tier3Boss_RocketBarrageVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	float32 m_LaunchAngle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplosionParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_ExplosionSound;
	CSoundEventName m_RocketFireSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_AuraModifier;
};
