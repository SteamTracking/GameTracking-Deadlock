// MGetKV3ClassDefaults = {
//	"_class": "ActiveModelConfig_t",
//	"m_Handle": 0,
//	"m_Name": "",
//	"m_AssociatedEntities":
//	[
//	],
//	"m_AssociatedEntityNames":
//	[
//	]
//}
// MHasKV3TransferPolymorphicClassname
class ActiveModelConfig_t
{
	ModelConfigHandle_t m_Handle;
	CUtlSymbolLarge m_Name;
	C_NetworkUtlVectorBase< CHandle< C_BaseModelEntity > > m_AssociatedEntities;
	C_NetworkUtlVectorBase< CUtlSymbolLarge > m_AssociatedEntityNames;
};
