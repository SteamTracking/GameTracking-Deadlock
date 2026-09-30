// MHasKV3TransferPolymorphicClassname
class CItem_ActiveReload_VData : public CitadelItemVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SuccessModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strSuccessSound;
	CSoundEventName m_strFailureSound;
	CSoundEventName m_strWindowEnteredSound;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SuccessParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_FailureParticle;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flGraceTime; // = 0.3
};
