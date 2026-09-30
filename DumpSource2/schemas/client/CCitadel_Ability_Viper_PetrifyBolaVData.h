// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Viper_PetrifyBolaVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	CEmbeddedSubclass< CCitadelModifier > m_PetrifyModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strBolaExplodeSound;
};
