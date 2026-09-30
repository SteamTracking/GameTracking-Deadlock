// MHasKV3TransferPolymorphicClassname
class CAbilityLightningBallVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ZapModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strHitSound;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strProjectileLoopingSound;
	CSoundEventName m_strExplodeSound;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ZapParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flHitSpeed; // = 80
	float32 m_flNonHeroHitSpeed; // = 56
};
