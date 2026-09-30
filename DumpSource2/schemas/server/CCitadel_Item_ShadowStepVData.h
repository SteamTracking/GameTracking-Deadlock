// MHasKV3TransferPolymorphicClassname
class CCitadel_Item_ShadowStepVData : public CitadelItemVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PulseParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TargetParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strPulseTickSound;
	// MPropertyStartGroup = "Gameplay"
	int32 m_iMaxTargets; // = 15
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strExplodeSound;
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastDelayParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TeleportTrailParticle;
	// MPropertyGroupName = "Gameplay"
	float32 m_flGroundProbeSpeed; // = 8000
	float32 m_flGroundStepDown; // = 128
	float32 m_flGroundStepUp; // = 20
	int32 m_iMaxGroundIterations; // = 20
	float32 m_flVelocityScale; // = 0.75
};
