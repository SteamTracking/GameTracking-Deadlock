// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_LuminousStrikeBuffVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strBuffReceivedSound;
	CSoundEventName m_strMaxBuffReceivedSound;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BuffParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_IncomingParticle;
	int32 m_nStackCountForMaxParticle; // = 5
};
