// MHasKV3TransferPolymorphicClassname
class CAbilityThumper2VData : public CitadelAbilityVData
{
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_StompParticle;
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_strStompExplosionSound;
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BarbedWireAuraModifier;
};
