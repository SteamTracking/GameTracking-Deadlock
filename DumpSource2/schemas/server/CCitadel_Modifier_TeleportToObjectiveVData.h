// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_TeleportToObjectiveVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TeleportOriginParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TeleportDestinationParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_TeleportStartSound;
	CSoundEventName m_TeleportCompleteSound;
	CSoundEventName m_TeleportArriveSound;
};
