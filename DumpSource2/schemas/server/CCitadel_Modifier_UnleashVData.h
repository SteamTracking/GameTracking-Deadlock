// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_UnleashVData : public CCitadel_Modifier_BaseEventProcVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_StackModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
};
