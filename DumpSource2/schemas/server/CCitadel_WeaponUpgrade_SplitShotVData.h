// MHasKV3TransferPolymorphicClassname
class CCitadel_WeaponUpgrade_SplitShotVData : public CitadelItemVData
{
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strWeaponShootSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BuffIndicatorModifier;
	CEmbeddedSubclass< CCitadelModifier > m_WeaponDamageBuff;
};
