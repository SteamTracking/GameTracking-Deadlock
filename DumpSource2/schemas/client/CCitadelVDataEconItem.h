class CCitadelVDataEconItem : public CVDataEconItem
{
	CUtlOrderedMap< HeroID_t, uint16 > m_mapEquipSlots;
	CUtlVector< CEmbeddedSubclass< CCitadel_Modifier_Econ > > m_vecEquipModifiers;
	CUtlOrderedMap< CUtlString, CVariantItemSlotDefinition > m_mapVariantSlots;
	CHideoutPropDefinition m_HideoutProp;
};
