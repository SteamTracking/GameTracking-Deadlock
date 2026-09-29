// MGetKV3ClassDefaults = {
//	"_class": "CPulseCell_Inflow_Method",
//	"m_nEditorNodeID": -1,
//	"m_EntryChunk": -1,
//	"m_RegisterMap":
//	{
//		"m_Inparams": null,
//		"m_Outparams": null
//	},
//	"m_MethodName": "",
//	"m_Description": "",
//	"m_bIsPublic": false,
//	"m_Args":
//	[
//	],
//	"m_ReturnValues":
//	[
//	]
//}
// MHasKV3TransferPolymorphicClassname
class CPulseCell_Inflow_Method : public CPulseCell_Inflow_BaseEntrypoint
{
	PulseSymbol_t m_MethodName;
	CUtlString m_Description;
	bool m_bIsPublic;
	CUtlLeanVector< CPulseRuntimeMethodArg > m_Args;
	CUtlLeanVector< CPulseRuntimeMethodArg > m_ReturnValues;
};
