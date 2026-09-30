// MHasKV3TransferPolymorphicClassname
class CCitadel_UtilityUpgrade_AOESmokeBombVData : public CitadelItemVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastCompleteParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strBuffGainedSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_InvisModifier;
};
