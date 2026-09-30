// MHasKV3TransferPolymorphicClassname
class CCitadel_WeaponUpgrade_ExpressShot_VData : public CitadelItemVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ReadyParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TracerAdditionParticle;
	// MPropertyGroupName = "Gameplay"
	float32 flShotDelay; // = 0.1
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strOffCooldownSound;
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ProcNotificationModifier;
};
