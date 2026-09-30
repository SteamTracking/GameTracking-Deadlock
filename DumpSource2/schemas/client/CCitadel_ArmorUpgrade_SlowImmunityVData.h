// MHasKV3TransferPolymorphicClassname
class CCitadel_ArmorUpgrade_SlowImmunityVData : public CitadelItemVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ImmunityModifier;
};
