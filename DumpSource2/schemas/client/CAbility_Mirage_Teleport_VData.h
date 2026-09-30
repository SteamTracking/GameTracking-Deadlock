// MHasKV3TransferPolymorphicClassname
class CAbility_Mirage_Teleport_VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_InterruptNotificationModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_preTeleportParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TeleportStartParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TeleportEndParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strArriveSound;
	CSoundEventName m_strDepartSound;
	CSoundEventName m_strChannelDestinationSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flObjectiveOffset; // = 200
};
