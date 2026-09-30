// MHasKV3TransferPolymorphicClassname
class CItem_WarpStone_VData : public CitadelItemVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_CasterModifier;
	CEmbeddedSubclass< CCitadelModifier > m_CasterDebuffModifier;
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
