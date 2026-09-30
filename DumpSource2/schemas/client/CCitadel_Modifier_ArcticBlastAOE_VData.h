// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_ArcticBlastAOE_VData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_FreezeModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
};
