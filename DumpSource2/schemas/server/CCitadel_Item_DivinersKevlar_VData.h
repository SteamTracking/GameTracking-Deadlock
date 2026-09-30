// MHasKV3TransferPolymorphicClassname
class CCitadel_Item_DivinersKevlar_VData : public CitadelItemVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_PrecastSpiritBuffModifier;
};
