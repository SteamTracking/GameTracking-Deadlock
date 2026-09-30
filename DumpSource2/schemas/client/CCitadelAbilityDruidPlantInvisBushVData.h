// MHasKV3TransferPolymorphicClassname
class CCitadelAbilityDruidPlantInvisBushVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_InvisBushModel;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_InvisAreaModifier;
};
