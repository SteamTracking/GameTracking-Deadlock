// MGetKV3ClassDefaults = {
//	"_class": "CNmGraphDocument",
//	"m_nVersion": 0,
//	"m_pRootGraph": null,
//	"m_variationHierarchy":
//	{
//		"m_variations":
//		[
//			{
//				"m_ID": "",
//				"m_parentID": "",
//				"m_skeleton": "",
//				"m_pUserData": null
//			}
//		]
//	},
//	"m_debugParameterSets":
//	[
//	],
//	"m_debugBoneFilterSets":
//	[
//	],
//	"m_dictionaryIDSetIDs":
//	[
//	]
//}
// MHasKV3TransferPolymorphicClassname
class CNmGraphDocument : public CNmAnimDocument
{
	CNmGraphDocFlowGraph* m_pRootGraph;
	CNmVariationHierarchy m_variationHierarchy;
	CUtlLeanVector< CNmGraphDocument::DebugParameterSet_t > m_debugParameterSets;
	CUtlLeanVector< CNmGraphDocument::DebugBoneFilterSet_t > m_debugBoneFilterSets;
	CUtlVector< V_uuid_t > m_dictionaryIDSetIDs;
};
