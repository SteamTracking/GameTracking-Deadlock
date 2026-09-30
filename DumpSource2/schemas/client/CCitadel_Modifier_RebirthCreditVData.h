// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_RebirthCreditVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DeployParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_RespawnParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_sDeploySound;
	CSoundEventName m_sRespawnSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flRespawnLifePct; // = 100
	float32 m_flRespawnDelay; // = 5
};
