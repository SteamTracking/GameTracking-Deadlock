// MGetKV3ClassDefaults = {
//	"_class": "ActiveModelConfig_t",
//	"m_Handle": 0,
//	"m_Name": "",
//	"m_AssociatedEntities":
//	[
//	],
//	"m_AssociatedEntityNames":
//	[
//	],
//	"m_vecAssociatedEntityCollidesWithHierarchy":
//	[
//	],
//	"m_vecAssociatedEntityCollidesOutsideHierarchy":
//	[
//	]
//}
// MHasKV3TransferPolymorphicClassname
class ActiveModelConfig_t
{
	ModelConfigHandle_t m_Handle;
	CUtlSymbolLarge m_Name;
	CNetworkUtlVectorBase< CHandle< CBaseModelEntity > > m_AssociatedEntities;
	CNetworkUtlVectorBase< CUtlSymbolLarge > m_AssociatedEntityNames;
	CUtlLeanVector< bool > m_vecAssociatedEntityCollidesWithHierarchy;
	CUtlLeanVector< bool > m_vecAssociatedEntityCollidesOutsideHierarchy;
};
