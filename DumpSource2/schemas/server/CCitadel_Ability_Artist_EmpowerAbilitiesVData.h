// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Artist_EmpowerAbilitiesVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_CastModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	// MPropertyStartGroup = "Gameplay"
	CUtlOrderedMap< EAbilitySlots_t, CSubclassName< 4 > > m_mapEmpoweredAbilities;
};
