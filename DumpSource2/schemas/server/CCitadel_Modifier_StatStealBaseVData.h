// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_StatStealBaseVData : public CCitadelModifierVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_StatStolenDebuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_StatStolenBuffModifier;
};
