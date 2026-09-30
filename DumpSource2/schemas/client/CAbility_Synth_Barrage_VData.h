// MHasKV3TransferPolymorphicClassname
class CAbility_Synth_Barrage_VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BarrageCasterModifier;
	CEmbeddedSubclass< CCitadelModifier > m_AmpModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ShootParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ImpactParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ChannelParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strProjectileLaunchSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flAttackInterval; // = 0.5
};
