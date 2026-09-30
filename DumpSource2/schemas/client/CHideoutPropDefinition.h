class CHideoutPropDefinition
{
	EHideoutPropType_t m_nPropType; // = "HIDEOUT_PROP_TYPE_INVALID"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_ModelName;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCTextureBase > > m_TextureName;
	CPanoramaImageName m_ImageName;
	CUtlVector< CEmbeddedSubclass< CCitadelModifier > > m_vecPropModifiers;
};
