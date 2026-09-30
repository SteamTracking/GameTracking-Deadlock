// MHasKV3TransferPolymorphicClassname
class CCitadel_WeaponUpgrade_GlassCannonVData : public CitadelItemVData
{
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strDeathSound;
	CSoundEventName m_strStackSound;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DeathParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ProcNotificationModifier;
};
