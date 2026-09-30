// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_CrushingFistsWatcher_VData : public CCitadel_Modifier_Intrinsic_BaseVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_StackingDebuffModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strStackSound;
};
