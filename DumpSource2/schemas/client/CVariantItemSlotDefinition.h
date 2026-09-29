// MGetKV3ClassDefaults = {
//	"m_unSlotID": 0,
//	"m_strSlotLocName": "",
//	"m_mapVariantStyles":
//	{
//	}
//}
class CVariantItemSlotDefinition
{
	VariantItemSlotID_t m_unSlotID;
	CUtlString m_strSlotLocName;
	CUtlOrderedMap< CUtlString, CVariantItemStyleDefinition > m_mapVariantStyles;
};
