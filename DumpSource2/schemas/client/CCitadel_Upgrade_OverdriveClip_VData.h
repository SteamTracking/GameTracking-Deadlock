// MHasKV3TransferPolymorphicClassname
class CCitadel_Upgrade_OverdriveClip_VData : public CitadelItemVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_OverdriveClipModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ReloadModifier;
};
