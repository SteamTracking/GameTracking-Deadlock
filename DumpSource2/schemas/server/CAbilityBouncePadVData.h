// MHasKV3TransferPolymorphicClassname
class CAbilityBouncePadVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BounceModifier;
	CEmbeddedSubclass< CCitadelModifier > m_AllyBounceModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SpeedOnLandModifier;
	CEmbeddedSubclass< CCitadelModifier > m_NoBounceModifier;
};
