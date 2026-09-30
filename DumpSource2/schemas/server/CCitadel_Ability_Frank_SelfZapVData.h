// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Frank_SelfZapVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	// MPropertyStartGroup = "Gameplay"
	CPiecewiseCurve m_healCurve;
};
