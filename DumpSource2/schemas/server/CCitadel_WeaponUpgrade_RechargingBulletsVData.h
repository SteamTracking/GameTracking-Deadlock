// MHasKV3TransferPolymorphicClassname
class CCitadel_WeaponUpgrade_RechargingBulletsVData : public CitadelItemVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ProcParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strProcSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ProcNotificationModifier;
};
