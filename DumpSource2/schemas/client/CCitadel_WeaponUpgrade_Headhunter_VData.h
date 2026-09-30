// MHasKV3TransferPolymorphicClassname
class CCitadel_WeaponUpgrade_Headhunter_VData : public CCitadel_WeaponUpgrade_HeadshotBooster_VData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_HeadshotBuffModifier;
};
