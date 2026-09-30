// MHasKV3TransferPolymorphicClassname
class CCitadel_Item_ShadowStrikeVData : public CitadelItemVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ShadowStrikeInvisModifier;
	CEmbeddedSubclass< CCitadelModifier > m_StealWatcherModifier;
};
