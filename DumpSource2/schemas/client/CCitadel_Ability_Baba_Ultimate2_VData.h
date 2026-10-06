// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Baba_Ultimate2_VData : public CBaseTieredLockonAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastDelayParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ChannelParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_LaunchParticle;
	// MPropertyStartGroup = "Visuals"
	float32 m_flChannelingMaxFallSpeed;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strSnapSound;
	CSoundEventName m_strRampSound;
	// MPropertyDescription = "Played when the channel ends with no full lock-on, so nothing is fired"
	CSoundEventName m_strEmptyReleaseSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flPostChannelDelay; // = 0.5
	// MPropertyStartGroup = "AnimGraph2"
	CGlobalSymbol m_strAG2UltFinishedAction; // = "cast_completed"
};
