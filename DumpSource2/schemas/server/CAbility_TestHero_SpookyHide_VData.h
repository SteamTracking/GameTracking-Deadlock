// MHasKV3TransferPolymorphicClassname
class CAbility_TestHero_SpookyHide_VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadel_Modifier_SpookyHide_Invis > m_InvisModifier;
	CEmbeddedSubclass< CCitadelModifier > m_RegenModifier;
};
