// MGetKV3ClassDefaults = {
//	"m_sOriginalModel": "",
//	"m_SwappedModel": "",
//	"m_nPriority": 0
//}
class ModelSwap_t
{
	CUtlString m_sOriginalModel;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_SwappedModel;
	int32 m_nPriority;
};
