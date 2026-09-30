// MHasKV3TransferPolymorphicClassname
class CAbilityCadencePrimaryWeaponVData : public CCitadel_Ability_PrimaryWeaponVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
};
