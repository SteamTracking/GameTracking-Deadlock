// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_BoloVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_TrapModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ReverseLeechModifier;
};
