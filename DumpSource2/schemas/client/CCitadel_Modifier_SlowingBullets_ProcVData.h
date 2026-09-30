// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_SlowingBullets_ProcVData : public CCitadel_Modifier_BaseEventProcVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	CEmbeddedSubclass< CCitadel_Modifier_Base_Buildup > m_BuildUpModifier;
};
