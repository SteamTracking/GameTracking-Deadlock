// MGetKV3ClassDefaults = {
//	"_class": "CPulseCell_WaitForCursorsWithTagBase",
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
//	"m_nCursorsAllowedToWait": -1,
//	"m_WaitComplete":
//	{
//		"m_SourceOutflowName": "",
//		"m_nDestChunk": -1,
//		"m_nInstruction": -1
//	}
//}
// MPulseEditorCanvasItemSpecKV3 = "{ className = 'IsControlFlowNode' }"
// MHasKV3TransferPolymorphicClassname
class CPulseCell_WaitForCursorsWithTagBase : public CPulseCell_BaseYieldingInflow
{
	// MPropertyDescription = "Any extra waiting cursors will be terminated. -1 for infinite cursors."
	int32 m_nCursorsAllowedToWait;
	CPulse_ResumePoint m_WaitComplete;
};
