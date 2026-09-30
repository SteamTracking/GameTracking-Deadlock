// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_MageWalkVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TeleportStartParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TeleportEndParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TeleportTrailParticle;
	// MPropertyGroupName = "Misc"
	float32 m_flPreTeleportDuration; // = 0.4
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_strAmbientLoopingLocalPlayerSound;
};
