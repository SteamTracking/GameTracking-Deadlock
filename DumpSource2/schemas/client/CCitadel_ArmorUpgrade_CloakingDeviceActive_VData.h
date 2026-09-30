// MHasKV3TransferPolymorphicClassname
class CCitadel_ArmorUpgrade_CloakingDeviceActive_VData : public CitadelItemVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_AmbushModifier;
	CEmbeddedSubclass< CCitadelModifier > m_InvisModifier;
};
