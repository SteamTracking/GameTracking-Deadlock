// MHasKV3TransferPolymorphicClassname
class CCitadel_Item_CelestialGuidanceVData : public CitadelItemVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PurgeCastParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strPurgeSound;
};
