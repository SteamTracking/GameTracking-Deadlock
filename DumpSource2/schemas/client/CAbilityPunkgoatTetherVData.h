// MHasKV3TransferPolymorphicClassname
class CAbilityPunkgoatTetherVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_FireRateSlowModifier;
	CEmbeddedSubclass< CCitadelModifier > m_TetheredModifier;
	CEmbeddedSubclass< CCitadelModifier > m_PullModifier;
	CEmbeddedSubclass< CCitadelModifier > m_WaitingToPullModifier;
	CEmbeddedSubclass< CCitadelModifier > m_UnstoppableModifier;
	// MPropertyStartGroup = "Visual"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_RopeParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strPullSound;
	CSoundEventName m_strTimerSound;
};
