// MHasKV3TransferPolymorphicClassname
class CCitadel_ArmorUpgrade_AutoCleanseVData : public CitadelItemVData
{
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_strPurgeSound;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PurgeCastParticle;
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BarrierModifier;
};
