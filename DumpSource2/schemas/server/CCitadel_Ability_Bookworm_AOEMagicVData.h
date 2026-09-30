// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Bookworm_AOEMagicVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_AreaModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flGroundHeightOffset; // = -8
	float32 m_flGroundDistance; // = 40
	float32 m_flSearchUpDistance; // = 2000
	float32 m_flSearchDownDistance; // = 2000
};
