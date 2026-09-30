// MHasKV3TransferPolymorphicClassname
class CAbilityGooGrenadeVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_GooGrenadeImpactModifier;
	CEmbeddedSubclass< CCitadelModifier > m_GooGrenadePuddleAuraModifier;
	CEmbeddedSubclass< CCitadelModifier > m_GooGrenadePuddleAuraFriendlyModifier;
	// MPropertyStartGroup = "Particles"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_GooGrenadeSkipParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_GooGrenadeExplodeParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_GrenadeHitSound;
	// MPropertyStartGroup = "BounceSettings"
	float32 m_flMinRestitution;
	float32 m_flMaxRestitution;
};
