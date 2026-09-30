// MHasKV3TransferPolymorphicClassname
class CCitadel_ArmorUpgrade_PersonalRejuvenatorVData : public CitadelItemVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DeployParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_RespawnParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_sDeploySound;
	CSoundEventName m_sRespawnSound;
};
