// MHasKV3TransferPolymorphicClassname
class CCitadel_Item_ComboBreakerVData : public CitadelItemVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ComboBreakerModifier;
	CEmbeddedSubclass< CCitadelModifier > m_HealModifier;
};
