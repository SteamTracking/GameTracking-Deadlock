// MHasKV3TransferPolymorphicClassname
class CCitadel_Item_TechDamagePulseVData : public CitadelItemVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PulseParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TargetParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strPulseTickSound;
	// MPropertyStartGroup = "Gameplay"
	int32 m_iMaxTargets; // = 2
};
