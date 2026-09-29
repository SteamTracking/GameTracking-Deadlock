// MGetKV3ClassDefaults = {
//	"_class": "CPulseCell_TestWaitWithAutoTracepoints",
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
//	"m_TracePrefix": "",
//	"m_WakeResume":
//	{
//		"m_SourceOutflowName": "",
//		"m_nDestChunk": -1,
//		"m_nInstruction": -1
//	}
//}
// MPropertyFriendlyName = "Wait and Trace"
// MHasKV3TransferPolymorphicClassname
class CPulseCell_TestWaitWithAutoTracepoints : public CPulseCell_BaseYieldingInflow
{
	CUtlString m_TracePrefix;
	CPulse_ResumePoint m_WakeResume;
};
