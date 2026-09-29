// MGetKV3ClassDefaults = {
//	"_class": "CPulseCell_FireCursors",
//	"m_nEditorNodeID": -1,
//	"m_BaseFlow_OnAfterCancel":
//	{
//		"m_SourceOutflowName": "",
//		"m_nDestChunk": -1,
//		"m_nInstruction": -1
//	},
//	"m_BaseFlow_WhileActive":
//	{
//		"m_SourceOutflowName": "",
//		"m_nDestChunk": -1,
//		"m_nInstruction": -1
//	},
//	"m_Outflows":
//	[
//	],
//	"m_bWaitForChildOutflows": true,
//	"m_OnFinished":
//	{
//		"m_SourceOutflowName": "",
//		"m_nDestChunk": -1,
//		"m_nInstruction": -1
//	}
//}
// MHasKV3TransferPolymorphicClassname
class CPulseCell_FireCursors : public CPulseCell_BaseYieldingInflow
{
	CUtlVector< CPulse_OutflowConnection > m_Outflows;
	bool m_bWaitForChildOutflows;
	CPulse_ResumePoint m_OnFinished;
};
