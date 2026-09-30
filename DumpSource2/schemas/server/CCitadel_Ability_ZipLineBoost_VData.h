// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_ZipLineBoost_VData : public CitadelAbilityVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ZipboostModifier;
	// MPropertyGroupName = "Gameplay"
	float32 m_flTimeToActivate;
	float32 m_flTimeForHint; // = 2
};
