// MHasKV3TransferPolymorphicClassname
class CAbilityLashFlogVData : public CitadelAbilityVData
{
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_FlogParticle;
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_FlogLifeLeachParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strHitConfirmSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_FlogDebuffModifier;
};
