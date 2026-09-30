// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_StanceActiveVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Gameplay"
	CUtlOrderedMap< EAbilitySlots_t, CSubclassName< 4 > > m_mapNewAbilities;
	// MPropertyStartGroup = "Visuals"
	ModelChange_t m_StanceModel;
	float32 m_flModelScale; // = 1
	HeroCardOverride_t m_HeroCardOverride;
};
