// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_IceGrenadeVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_IceGrenadeSlowModifier;
	CEmbeddedSubclass< CCitadelModifier > m_EnemyAuraModifier;
	CEmbeddedSubclass< CCitadelModifier > m_FriendlyAuraModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_ExplosionSound;
};
