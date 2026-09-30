// MHasKV3TransferPolymorphicClassname
class CCitadel_WeaponUpgrade_BurstFireVData : public CitadelItemVData
{
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_ActivationSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
};
