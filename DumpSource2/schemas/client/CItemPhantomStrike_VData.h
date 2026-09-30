// MHasKV3TransferPolymorphicClassname
class CItemPhantomStrike_VData : public CitadelItemVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_PullDownModifier;
	CEmbeddedSubclass< CCitadelModifier > m_CasterModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strExplodeSound;
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ImpactParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BuffParticle;
	// MPropertyGroupName = "Gameplay"
	float32 m_flTeleportDistance; // = 120
	float32 m_flVelocityScale; // = 0.75
};
