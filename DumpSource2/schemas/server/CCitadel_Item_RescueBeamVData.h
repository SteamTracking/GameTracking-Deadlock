// MHasKV3TransferPolymorphicClassname
class CCitadel_Item_RescueBeamVData : public CitadelItemVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DispelAndHealModifier;
	CEmbeddedSubclass< CCitadelModifier > m_PullModifier;
	CEmbeddedSubclass< CCitadelModifier > m_AfterChannelModifier;
	// MPropertyStartGroup = "Gameplay"
	bool m_bHealCaster; // = true
	bool m_bAllowPull; // = true
};
