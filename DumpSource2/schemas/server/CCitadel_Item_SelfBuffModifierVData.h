// MHasKV3TransferPolymorphicClassname
class CCitadel_Item_SelfBuffModifierVData : public CitadelItemVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
};
