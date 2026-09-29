// MGetKV3ClassDefaults = {
//	"m_sOriginalMaterial": "",
//	"m_SwappedMaterial": "",
//	"m_nPriority": 0
//}
class MaterialSwap_t
{
	CUtlString m_sOriginalMaterial;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIMaterial2 > > m_SwappedMaterial;
	int32 m_nPriority;
};
