class CVariantItemStyleDefinition
{
	VariantItemSlotStyleID_t m_unSlotStyleID;
	CUtlString m_strStyleLocName;
	CPanoramaImageName m_strSwatchImage;
	CUtlVector< CEmbeddedSubclass< CCitadel_Modifier_Econ > > m_vecStyleEquipModifiers;
};
