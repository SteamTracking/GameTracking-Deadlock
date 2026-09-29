// MGetKV3ClassDefaults = {
//	"m_nPropType": "HIDEOUT_PROP_TYPE_INVALID",
//	"m_ModelName": "",
//	"m_TextureName": "",
//	"m_ImageName": "",
//	"m_vecPropModifiers":
//	[
//	]
//}
class CHideoutPropDefinition
{
	EHideoutPropType_t m_nPropType;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_ModelName;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCTextureBase > > m_TextureName;
	CPanoramaImageName m_ImageName;
	CUtlVector< CEmbeddedSubclass< CCitadelModifier > > m_vecPropModifiers;
};
