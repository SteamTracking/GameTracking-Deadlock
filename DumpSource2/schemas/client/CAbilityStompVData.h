// MHasKV3TransferPolymorphicClassname
class CAbilityStompVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_StompParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strStompExplosionSound;
	CSoundEventName m_strCastDelayLocalPlayerSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BulletResistModifier;
};
