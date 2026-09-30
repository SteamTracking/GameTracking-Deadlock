// MHasKV3TransferPolymorphicClassname
class CAbilitySprintVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SprintParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strSprintSound;
	// MPropertyStartGroup = "+Sprint Properties"
	float32 m_flSprintAccMS; // = 0.6
};
